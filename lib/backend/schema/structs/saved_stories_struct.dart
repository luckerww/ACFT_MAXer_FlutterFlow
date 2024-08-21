// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SavedStoriesStruct extends FFFirebaseStruct {
  SavedStoriesStruct({
    List<String>? stories,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _stories = stories,
        super(firestoreUtilData);

  // "stories" field.
  List<String>? _stories;
  List<String> get stories => _stories ?? const [];
  set stories(List<String>? val) => _stories = val;

  void updateStories(Function(List<String>) updateFn) {
    updateFn(_stories ??= []);
  }

  bool hasStories() => _stories != null;

  static SavedStoriesStruct fromMap(Map<String, dynamic> data) =>
      SavedStoriesStruct(
        stories: getDataList(data['stories']),
      );

  static SavedStoriesStruct? maybeFromMap(dynamic data) => data is Map
      ? SavedStoriesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'stories': _stories,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'stories': serializeParam(
          _stories,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static SavedStoriesStruct fromSerializableMap(Map<String, dynamic> data) =>
      SavedStoriesStruct(
        stories: deserializeParam<String>(
          data['stories'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'SavedStoriesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SavedStoriesStruct &&
        listEquality.equals(stories, other.stories);
  }

  @override
  int get hashCode => const ListEquality().hash([stories]);
}

SavedStoriesStruct createSavedStoriesStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SavedStoriesStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SavedStoriesStruct? updateSavedStoriesStruct(
  SavedStoriesStruct? savedStories, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    savedStories
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSavedStoriesStructData(
  Map<String, dynamic> firestoreData,
  SavedStoriesStruct? savedStories,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (savedStories == null) {
    return;
  }
  if (savedStories.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && savedStories.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final savedStoriesData =
      getSavedStoriesFirestoreData(savedStories, forFieldValue);
  final nestedData =
      savedStoriesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = savedStories.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSavedStoriesFirestoreData(
  SavedStoriesStruct? savedStories, [
  bool forFieldValue = false,
]) {
  if (savedStories == null) {
    return {};
  }
  final firestoreData = mapToFirestore(savedStories.toMap());

  // Add any Firestore field values
  savedStories.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSavedStoriesListFirestoreData(
  List<SavedStoriesStruct>? savedStoriess,
) =>
    savedStoriess?.map((e) => getSavedStoriesFirestoreData(e, true)).toList() ??
    [];
