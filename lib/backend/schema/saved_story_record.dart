import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SavedStoryRecord extends FirestoreRecord {
  SavedStoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "story_text" field.
  String? _storyText;
  String get storyText => _storyText ?? '';
  bool hasStoryText() => _storyText != null;

  // "date_created" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _storyText = snapshotData['story_text'] as String?;
    _dateCreated = snapshotData['date_created'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('saved_story')
          : FirebaseFirestore.instance.collectionGroup('saved_story');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('saved_story').doc(id);

  static Stream<SavedStoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SavedStoryRecord.fromSnapshot(s));

  static Future<SavedStoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SavedStoryRecord.fromSnapshot(s));

  static SavedStoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SavedStoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SavedStoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SavedStoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SavedStoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SavedStoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSavedStoryRecordData({
  String? storyText,
  DateTime? dateCreated,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'story_text': storyText,
      'date_created': dateCreated,
    }.withoutNulls,
  );

  return firestoreData;
}

class SavedStoryRecordDocumentEquality implements Equality<SavedStoryRecord> {
  const SavedStoryRecordDocumentEquality();

  @override
  bool equals(SavedStoryRecord? e1, SavedStoryRecord? e2) {
    return e1?.storyText == e2?.storyText && e1?.dateCreated == e2?.dateCreated;
  }

  @override
  int hash(SavedStoryRecord? e) =>
      const ListEquality().hash([e?.storyText, e?.dateCreated]);

  @override
  bool isValidKey(Object? o) => o is SavedStoryRecord;
}
