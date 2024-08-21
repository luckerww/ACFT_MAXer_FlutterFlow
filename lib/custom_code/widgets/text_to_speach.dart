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

import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeach extends StatefulWidget {
  const TextToSpeach({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _TextToSpeachState createState() => _TextToSpeachState();
}

enum TtsState { playing, stopped, paused, continued }

class _TextToSpeachState extends State<TextToSpeach> {
  late FlutterTts flutterTts;
  String? language;
  String? engine;
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;
  bool isCurrentLanguageInstalled = false;

  String? _newVoiceText =
      "hello world hello world hello world hello world hello world hello world hello world hello world hello world";
  int? _inputLength;

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;
  get isPaused => ttsState == TtsState.paused;
  get isContinued => ttsState == TtsState.continued;

  // bool get isIOS => !kIsWeb && Platform.isIOS;
  // bool get isAndroid => !kIsWeb && Platform.isAndroid;
  // bool get isWindows => !kIsWeb && Platform.isWindows;
  // bool get isWeb => kIsWeb;

  @override
  initState() {
    super.initState();
    // initTts();
  }

  initTts() {
    flutterTts = FlutterTts();

    // _setAwaitOptions();

    // flutterTts.setStartHandler(() {
    //   setState(() {
    //     print("Playing");
    //     ttsState = TtsState.playing;
    //   });
    // });

    // flutterTts.setCompletionHandler(() {
    //   setState(() {
    //     print("Complete");
    //     ttsState = TtsState.stopped;
    //   });
    // });

    // flutterTts.setCancelHandler(() {
    //   setState(() {
    //     print("Cancel");
    //     ttsState = TtsState.stopped;
    //   });
    // });

    // flutterTts.setPauseHandler(() {
    //   setState(() {
    //     print("Paused");
    //     ttsState = TtsState.paused;
    //   });
    // });

    // flutterTts.setContinueHandler(() {
    //   setState(() {
    //     print("Continued");
    //     ttsState = TtsState.continued;
    //   });
    // });

    // flutterTts.setErrorHandler((msg) {
    //   setState(() {
    //     print("error: $msg");
    //     ttsState = TtsState.stopped;
    //   });
    // });
  }

  Future _speak() async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);

    // if (_newVoiceText != null) {
    // if (_newVoiceText!.isNotEmpty) {
    await flutterTts.speak("hello world");
    // }
    // }
  }

  // Future _setAwaitOptions() async {
  //   await flutterTts.awaitSpeakCompletion(true);
  // }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  Future _pause() async {
    var result = await flutterTts.pause();
    if (result == 1) setState(() => ttsState = TtsState.paused);
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  // void _onChange(String text) {
  //   setState(() {
  //     _newVoiceText = text;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return _btnSection();
  }

  Widget _btnSection() {
    return Container(
      padding: EdgeInsets.only(top: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(Colors.green, Colors.greenAccent, Icons.play_arrow,
              'PLAY', _speak),
          _buildButtonColumn(
              Colors.red, Colors.redAccent, Icons.stop, 'STOP', _stop),
          _buildButtonColumn(
              Colors.blue, Colors.blueAccent, Icons.pause, 'PAUSE', _pause),
        ],
      ),
    );
  }

  Column _buildButtonColumn(Color color, Color splashColor, IconData icon,
      String label, Function func) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              icon: Icon(icon),
              color: color,
              splashColor: splashColor,
              onPressed: () => func()),
          Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Text(label,
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: color)))
        ]);
  }
}
