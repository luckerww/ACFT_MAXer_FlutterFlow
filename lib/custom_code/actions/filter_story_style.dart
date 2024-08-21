// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// import 'package:bedtime_stories/backend/schema/structs/story_style_struct.dart';

Future<String> filterStoryStyle(List<StoryStyleStruct> storyStyle) async {
  String selectedStory = "";
  for (int index = 0; index < storyStyle.length; index++) {
    if (storyStyle[index].isSelected) {
      if (selectedStory.isEmpty) {
        selectedStory = storyStyle[index].storyType;
      } else if (index == (storyStyle.length - 1)) {
        selectedStory = selectedStory + " and " + storyStyle[index].storyType;
      } else {
        selectedStory = selectedStory + ", " + storyStyle[index].storyType;
      }
    }
  }

  return selectedStory;
}
