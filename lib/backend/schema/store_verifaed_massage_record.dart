import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StoreVerifaedMassageRecord extends FirestoreRecord {
  StoreVerifaedMassageRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "storeRef" field.
  DocumentReference? _storeRef;
  DocumentReference? get storeRef => _storeRef;
  bool hasStoreRef() => _storeRef != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "datetimeanswer" field.
  DateTime? _datetimeanswer;
  DateTime? get datetimeanswer => _datetimeanswer;
  bool hasDatetimeanswer() => _datetimeanswer != null;

  void _initializeFields() {
    _storeRef = snapshotData['storeRef'] as DocumentReference?;
    _message = snapshotData['message'] as String?;
    _datetimeanswer = snapshotData['datetimeanswer'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('storeVerifaedMassage');

  static Stream<StoreVerifaedMassageRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => StoreVerifaedMassageRecord.fromSnapshot(s));

  static Future<StoreVerifaedMassageRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => StoreVerifaedMassageRecord.fromSnapshot(s));

  static StoreVerifaedMassageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StoreVerifaedMassageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StoreVerifaedMassageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StoreVerifaedMassageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StoreVerifaedMassageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StoreVerifaedMassageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStoreVerifaedMassageRecordData({
  DocumentReference? storeRef,
  String? message,
  DateTime? datetimeanswer,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'storeRef': storeRef,
      'message': message,
      'datetimeanswer': datetimeanswer,
    }.withoutNulls,
  );

  return firestoreData;
}

class StoreVerifaedMassageRecordDocumentEquality
    implements Equality<StoreVerifaedMassageRecord> {
  const StoreVerifaedMassageRecordDocumentEquality();

  @override
  bool equals(StoreVerifaedMassageRecord? e1, StoreVerifaedMassageRecord? e2) {
    return e1?.storeRef == e2?.storeRef &&
        e1?.message == e2?.message &&
        e1?.datetimeanswer == e2?.datetimeanswer;
  }

  @override
  int hash(StoreVerifaedMassageRecord? e) =>
      const ListEquality().hash([e?.storeRef, e?.message, e?.datetimeanswer]);

  @override
  bool isValidKey(Object? o) => o is StoreVerifaedMassageRecord;
}
