import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppliWholeSaleActRecord extends FirestoreRecord {
  AppliWholeSaleActRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "storeref" field.
  DocumentReference? _storeref;
  DocumentReference? get storeref => _storeref;
  bool hasStoreref() => _storeref != null;

  // "userref" field.
  DocumentReference? _userref;
  DocumentReference? get userref => _userref;
  bool hasUserref() => _userref != null;

  // "action_time" field.
  DateTime? _actionTime;
  DateTime? get actionTime => _actionTime;
  bool hasActionTime() => _actionTime != null;

  // "done" field.
  bool? _done;
  bool get done => _done ?? false;
  bool hasDone() => _done != null;

  void _initializeFields() {
    _storeref = snapshotData['storeref'] as DocumentReference?;
    _userref = snapshotData['userref'] as DocumentReference?;
    _actionTime = snapshotData['action_time'] as DateTime?;
    _done = snapshotData['done'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appliWholeSaleAct');

  static Stream<AppliWholeSaleActRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppliWholeSaleActRecord.fromSnapshot(s));

  static Future<AppliWholeSaleActRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AppliWholeSaleActRecord.fromSnapshot(s));

  static AppliWholeSaleActRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppliWholeSaleActRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppliWholeSaleActRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppliWholeSaleActRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppliWholeSaleActRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppliWholeSaleActRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppliWholeSaleActRecordData({
  DocumentReference? storeref,
  DocumentReference? userref,
  DateTime? actionTime,
  bool? done,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'storeref': storeref,
      'userref': userref,
      'action_time': actionTime,
      'done': done,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppliWholeSaleActRecordDocumentEquality
    implements Equality<AppliWholeSaleActRecord> {
  const AppliWholeSaleActRecordDocumentEquality();

  @override
  bool equals(AppliWholeSaleActRecord? e1, AppliWholeSaleActRecord? e2) {
    return e1?.storeref == e2?.storeref &&
        e1?.userref == e2?.userref &&
        e1?.actionTime == e2?.actionTime &&
        e1?.done == e2?.done;
  }

  @override
  int hash(AppliWholeSaleActRecord? e) => const ListEquality()
      .hash([e?.storeref, e?.userref, e?.actionTime, e?.done]);

  @override
  bool isValidKey(Object? o) => o is AppliWholeSaleActRecord;
}
