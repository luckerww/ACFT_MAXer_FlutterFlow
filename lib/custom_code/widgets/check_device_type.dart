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

import 'package:flutter/foundation.dart';

class CheckDeviceType extends StatelessWidget {
  const CheckDeviceType({
    Key? key,
    this.width,
    this.height,
    required this.story,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String story;

  @override // Added @override annotation
  Widget build(BuildContext context) {
    print('k is web $kIsWeb');
    if (kIsWeb) {
      return OpenAiAudio(
        width: width,
        height: height,
        story: story,
      ); // Passed width and height parameters to OpenAiAudio widget
      // return Container();
    } else {
      return OpenAiAudioMobile(
        width: width,
        height: height,
        story: story,
      ); // Added return statement for the else case
    }
  }
}
