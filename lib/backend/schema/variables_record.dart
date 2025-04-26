import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VariablesRecord extends FirestoreRecord {
  VariablesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "watercounter" field.
  int? _watercounter;
  int get watercounter => _watercounter ?? 0;
  bool hasWatercounter() => _watercounter != null;

  void _initializeFields() {
    _watercounter = castToType<int>(snapshotData['watercounter']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('variables');

  static Stream<VariablesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VariablesRecord.fromSnapshot(s));

  static Future<VariablesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VariablesRecord.fromSnapshot(s));

  static VariablesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VariablesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VariablesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VariablesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VariablesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VariablesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVariablesRecordData({
  int? watercounter,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'watercounter': watercounter,
    }.withoutNulls,
  );

  return firestoreData;
}

class VariablesRecordDocumentEquality implements Equality<VariablesRecord> {
  const VariablesRecordDocumentEquality();

  @override
  bool equals(VariablesRecord? e1, VariablesRecord? e2) {
    return e1?.watercounter == e2?.watercounter;
  }

  @override
  int hash(VariablesRecord? e) => const ListEquality().hash([e?.watercounter]);

  @override
  bool isValidKey(Object? o) => o is VariablesRecord;
}
