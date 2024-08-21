// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// // Automatic FlutterFlow imports
// // Begin custom widget code
// // DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// // ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html;
import 'dart:convert';
import 'dart:typed_data';

class OpenAiAudio extends StatefulWidget {
  const OpenAiAudio({
    Key? key,
    this.width,
    this.height,
    required this.story,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String story;

  @override
  _OpenAiAudioState createState() => _OpenAiAudioState();
}

class _OpenAiAudioState extends State<OpenAiAudio> {
  final String openAiApiKey =
      "sk-proj-Z4R3E2MiI92sKvZ1qQbmT3BlbkFJcYYcgczwHWIJV38LUMyn";
  final String openAiApiEndpoint = "https://api.openai.com/v1/audio/speech";

  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  String filePath = '';
  bool isAudioLoaded = false;

  @override
  void initState() {
    super.initState();

    _synthesizeAndPlayAudio(widget.story);

    //liste to states: playing, paused, stopped
    _audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    //listen to audio duration
    _audioPlayer.onDurationChanged.listen((newDuraton) {
      setState(() {
        duration = newDuraton;
      });
    });

    //listen to audio position
    _audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future<void> _synthesizeAndPlayAudio(String text) async {
    try {
      final response = await http.post(
        Uri.parse(openAiApiEndpoint),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAiApiKey',
        },
        body: jsonEncode({"model": "tts-1", "input": text, "voice": "onyx"}),
      );

      if (response.statusCode == 200) {
        // Successful response

        Uint8List audioBytes = Uint8List.fromList(response.bodyBytes);

        // For web, use the URL directly without saving as a blob
        if (kIsWeb) {
          // For web, directly create a Blob and generate an object URL from it
          final blob = html.Blob([audioBytes], 'audio/mpeg');
          final url = html.Url.createObjectUrlFromBlob(blob);
          setState(() {
            filePath = url; // Store the generated object URL
            isAudioLoaded = true;
          });
          // Set the audio source to the object URL
          await _audioPlayer.setSourceUrl(filePath);
        } else {
          // Non-web platforms can follow a similar approach to what you previously had,
          // involving saving to a file and setting the file path as the source.
        }
      } else {
        // Handle API error
      }
    } catch (e) {
      // Handle other errors
    }
  }

  Future<String> _saveAudioToFile(Uint8List audioBytes, String fileName) async {
    final directory;
    // For web, use the dart:html library to create a Blob and save it
    if (kIsWeb) {
      directory = html.window.localStorage;
      if (html.window != null) {
        final blob = html.Blob([audioBytes]);

        final url = html.Url.createObjectUrlFromBlob(blob);
        return url;
      }
    } else {
      directory = await getTemporaryDirectory();
      // For other platforms (iOS, Android), save as a file
      final file = File('${directory.path}/$fileName');
      await file.writeAsBytes(audioBytes);
      return file.path;
    }
    return "";
  }

  String formatTime(Duration duration) {
    return [duration.inMinutes, duration.inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(':');
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (FFAppState().isAudioStopped) {
      _audioPlayer.stop();
    }
    return isAudioLoaded
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.zero,
                child: Slider(
                  min: 0,
                  activeColor: Color.fromRGBO(1, 65, 101, 1),
                  inactiveColor: Colors.white,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: (value) async {
                    final position = Duration(seconds: value.toInt());
                    await _audioPlayer.seek(position);

                    // if audio paused
                    if (!isPlaying) {
                      await _audioPlayer.resume();
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatTime(position),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Text(
                      formatTime(duration - position),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.fast_rewind,
                      color: Colors.white,
                    ),
                    iconSize: 30,
                    onPressed: () async {
                      final durationDecrease = Duration(seconds: 5);
                      Duration newPosition = position - durationDecrease;
                      await _audioPlayer.seek(newPosition);

                      if (!isPlaying) {
                        await _audioPlayer.resume();
                      }
                    },
                  ),
                  SizedBox(width: 30),
                  CircleAvatar(
                    backgroundColor: Color.fromRGBO(1, 65, 101, 1),
                    radius: 35,
                    child: IconButton(
                      icon: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                      ),
                      iconSize: 30,
                      onPressed: () async {
                        if (isPlaying) {
                          await _audioPlayer.pause();
                        } else {
                          await _audioPlayer.setVolume(1);
                          await _audioPlayer.resume();
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 30),
                  IconButton(
                    icon: Icon(
                      Icons.fast_forward,
                      color: Colors.white,
                    ),
                    iconSize: 30,
                    onPressed: () async {
                      final durationDecrease = Duration(seconds: 5);
                      await _audioPlayer.seek(position + durationDecrease);

                      // if audio paused
                      if (!isPlaying) {
                        await _audioPlayer.resume();
                      }
                    },
                  ),
                ],
              ),
            ],
          )
        : Center(
            child: Text(
            "Processing your audio....",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: 'Roboto',
            ),
          ));
  }
}
