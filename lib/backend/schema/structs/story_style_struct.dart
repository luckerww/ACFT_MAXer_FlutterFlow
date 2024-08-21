// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StoryStyleStruct extends FFFirebaseStruct {
  StoryStyleStruct({
    String? storyType,
    Color? containerColor,
    bool? isSelected,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _storyType = storyType,
        _containerColor = containerColor,
        _isSelected = isSelected,
        super(firestoreUtilData);

  // "story_type" field.
  String? _storyType;
  String get storyType => _storyType ?? '';
  set storyType(String? val) => _storyType = val;

  bool hasStoryType() => _storyType != null;

  // "container_color" field.
  Color? _containerColor;
  Color? get containerColor => _containerColor;
  set containerColor(Color? val) => _containerColor = val;

  bool hasContainerColor() => _containerColor != null;

  // "isSelected" field.
  bool? _isSelected;
  bool get isSelected => _isSelected ?? false;
  set isSelected(bool? val) => _isSelected = val;

  bool hasIsSelected() => _isSelected != null;

  static StoryStyleStruct fromMap(Map<String, dynamic> data) =>
      StoryStyleStruct(
        storyType: data['story_type'] as String?,
        containerColor: getSchemaColor(data['container_color']),
        isSelected: data['isSelected'] as bool?,
      );

  static StoryStyleStruct? maybeFromMap(dynamic data) => data is Map
      ? StoryStyleStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'story_type': _storyType,
        'container_color': _containerColor,
        'isSelected': _isSelected,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'story_type': serializeParam(
          _storyType,
          ParamType.String,
        ),
        'container_color': serializeParam(
          _containerColor,
          ParamType.Color,
        ),
        'isSelected': serializeParam(
          _isSelected,
          ParamType.bool,
        ),
      }.withoutNulls;

  static StoryStyleStruct fromSerializableMap(Map<String, dynamic> data) =>
      StoryStyleStruct(
        storyType: deserializeParam(
          data['story_type'],
          ParamType.String,
          false,
        ),
        containerColor: deserializeParam(
          data['container_color'],
          ParamType.Color,
          false,
        ),
        isSelected: deserializeParam(
          data['isSelected'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'StoryStyleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StoryStyleStruct &&
        storyType == other.storyType &&
        containerColor == other.containerColor &&
        isSelected == other.isSelected;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([storyType, containerColor, isSelected]);
}

StoryStyleStruct createStoryStyleStruct({
  String? storyType,
  Color? containerColor,
  bool? isSelected,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StoryStyleStruct(
      storyType: storyType,
      containerColor: containerColor,
      isSelected: isSelected,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StoryStyleStruct? updateStoryStyleStruct(
  StoryStyleStruct? storyStyle, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    storyStyle
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStoryStyleStructData(
  Map<String, dynamic> firestoreData,
  StoryStyleStruct? storyStyle,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (storyStyle == null) {
    return;
  }
  if (storyStyle.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && storyStyle.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final storyStyleData = getStoryStyleFirestoreData(storyStyle, forFieldValue);
  final nestedData = storyStyleData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = storyStyle.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStoryStyleFirestoreData(
  StoryStyleStruct? storyStyle, [
  bool forFieldValue = false,
]) {
  if (storyStyle == null) {
    return {};
  }
  final firestoreData = mapToFirestore(storyStyle.toMap());

  // Add any Firestore field values
  storyStyle.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStoryStyleListFirestoreData(
  List<StoryStyleStruct>? storyStyles,
) =>
    storyStyles?.map((e) => getStoryStyleFirestoreData(e, true)).toList() ?? [];
