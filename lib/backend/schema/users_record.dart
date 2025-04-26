import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  bool hasNumber() => _number != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "waterCounter" field.
  int? _waterCounter;
  int get waterCounter => _waterCounter ?? 0;
  bool hasWaterCounter() => _waterCounter != null;

  // "shelterCounter" field.
  int? _shelterCounter;
  int get shelterCounter => _shelterCounter ?? 0;
  bool hasShelterCounter() => _shelterCounter != null;

  // "clotherCounter" field.
  int? _clotherCounter;
  int get clotherCounter => _clotherCounter ?? 0;
  bool hasClotherCounter() => _clotherCounter != null;

  // "money" field.
  int? _money;
  int get money => _money ?? 0;
  bool hasMoney() => _money != null;

  // "other" field.
  String? _other;
  String get other => _other ?? '';
  bool hasOther() => _other != null;

  // "clothesCOunter" field.
  int? _clothesCOunter;
  int get clothesCOunter => _clothesCOunter ?? 0;
  bool hasClothesCOunter() => _clothesCOunter != null;

  // "newlocation" field.
  List<LatLng>? _newlocation;
  List<LatLng> get newlocation => _newlocation ?? const [];
  bool hasNewlocation() => _newlocation != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _age = castToType<int>(snapshotData['age']);
    _number = castToType<int>(snapshotData['number']);
    _location = snapshotData['location'] as LatLng?;
    _description = snapshotData['description'] as String?;
    _waterCounter = castToType<int>(snapshotData['waterCounter']);
    _shelterCounter = castToType<int>(snapshotData['shelterCounter']);
    _clotherCounter = castToType<int>(snapshotData['clotherCounter']);
    _money = castToType<int>(snapshotData['money']);
    _other = snapshotData['other'] as String?;
    _clothesCOunter = castToType<int>(snapshotData['clothesCOunter']);
    _newlocation = getDataList(snapshotData['newlocation']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? name,
  int? age,
  int? number,
  LatLng? location,
  String? description,
  int? waterCounter,
  int? shelterCounter,
  int? clotherCounter,
  int? money,
  String? other,
  int? clothesCOunter,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'age': age,
      'number': number,
      'location': location,
      'description': description,
      'waterCounter': waterCounter,
      'shelterCounter': shelterCounter,
      'clotherCounter': clotherCounter,
      'money': money,
      'other': other,
      'clothesCOunter': clothesCOunter,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.age == e2?.age &&
        e1?.number == e2?.number &&
        e1?.location == e2?.location &&
        e1?.description == e2?.description &&
        e1?.waterCounter == e2?.waterCounter &&
        e1?.shelterCounter == e2?.shelterCounter &&
        e1?.clotherCounter == e2?.clotherCounter &&
        e1?.money == e2?.money &&
        e1?.other == e2?.other &&
        e1?.clothesCOunter == e2?.clothesCOunter &&
        listEquality.equals(e1?.newlocation, e2?.newlocation);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.name,
        e?.age,
        e?.number,
        e?.location,
        e?.description,
        e?.waterCounter,
        e?.shelterCounter,
        e?.clotherCounter,
        e?.money,
        e?.other,
        e?.clothesCOunter,
        e?.newlocation
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
