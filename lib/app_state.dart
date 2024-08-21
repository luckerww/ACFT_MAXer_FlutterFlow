import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _wasAudioPaused = false;
  bool get wasAudioPaused => _wasAudioPaused;
  set wasAudioPaused(bool value) {
    _wasAudioPaused = value;
  }

  double _end = 0.0;
  double get end => _end;
  set end(double value) {
    _end = value;
  }

  bool _isAudioStopped = false;
  bool get isAudioStopped => _isAudioStopped;
  set isAudioStopped(bool value) {
    _isAudioStopped = value;
  }

  String _filePath = '';
  String get filePath => _filePath;
  set filePath(String value) {
    _filePath = value;
  }

  List<StoryStyleStruct> _storyStyle = [
    StoryStyleStruct.fromSerializableMap(jsonDecode(
        '{\"story_type\":\"Any\",\"container_color\":\"#96baee\",\"isSelected\":\"false\"}')),
    StoryStyleStruct.fromSerializableMap(jsonDecode(
        '{\"story_type\":\"Epic\",\"container_color\":\"#96baee\",\"isSelected\":\"false\"}')),
    StoryStyleStruct.fromSerializableMap(jsonDecode(
        '{\"story_type\":\"Sci-Fi\",\"container_color\":\"#96baee\",\"isSelected\":\"false\"}')),
    StoryStyleStruct.fromSerializableMap(jsonDecode(
        '{\"story_type\":\"Funny\",\"container_color\":\"#96baee\",\"isSelected\":\"false\"}')),
    StoryStyleStruct.fromSerializableMap(jsonDecode(
        '{\"story_type\":\"Suspence\",\"container_color\":\"#96baee\",\"isSelected\":\"false\"}')),
    StoryStyleStruct.fromSerializableMap(jsonDecode(
        '{\"story_type\":\"Thriller\",\"container_color\":\"#96baee\",\"isSelected\":\"false\"}')),
    StoryStyleStruct.fromSerializableMap(jsonDecode(
        '{\"story_type\":\"Adventure\",\"container_color\":\"#96baee\",\"isSelected\":\"false\"}')),
    StoryStyleStruct.fromSerializableMap(jsonDecode(
        '{\"story_type\":\"Family\",\"container_color\":\"#96baee\",\"isSelected\":\"false\"}'))
  ];
  List<StoryStyleStruct> get storyStyle => _storyStyle;
  set storyStyle(List<StoryStyleStruct> value) {
    _storyStyle = value;
  }

  void addToStoryStyle(StoryStyleStruct value) {
    storyStyle.add(value);
  }

  void removeFromStoryStyle(StoryStyleStruct value) {
    storyStyle.remove(value);
  }

  void removeAtIndexFromStoryStyle(int index) {
    storyStyle.removeAt(index);
  }

  void updateStoryStyleAtIndex(
    int index,
    StoryStyleStruct Function(StoryStyleStruct) updateFn,
  ) {
    storyStyle[index] = updateFn(_storyStyle[index]);
  }

  void insertAtIndexInStoryStyle(int index, StoryStyleStruct value) {
    storyStyle.insert(index, value);
  }

  bool _isSingUpLoading = false;
  bool get isSingUpLoading => _isSingUpLoading;
  set isSingUpLoading(bool value) {
    _isSingUpLoading = value;
  }

  bool _isLoginLoading = false;
  bool get isLoginLoading => _isLoginLoading;
  set isLoginLoading(bool value) {
    _isLoginLoading = value;
  }
}
