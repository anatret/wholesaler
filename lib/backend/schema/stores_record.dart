import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StoresRecord extends FirestoreRecord {
  StoresRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "storeName" field.
  String? _storeName;
  String get storeName => _storeName ?? '';
  bool hasStoreName() => _storeName != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "room" field.
  String? _room;
  String get room => _room ?? '';
  bool hasRoom() => _room != null;

  // "itsCoupang" field.
  bool? _itsCoupang;
  bool get itsCoupang => _itsCoupang ?? false;
  bool hasItsCoupang() => _itsCoupang != null;

  void _initializeFields() {
    _storeName = snapshotData['storeName'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _address = snapshotData['address'] as String?;
    _phone = snapshotData['phone'] as String?;
    _room = snapshotData['room'] as String?;
    _itsCoupang = snapshotData['itsCoupang'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stores');

  static Stream<StoresRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StoresRecord.fromSnapshot(s));

  static Future<StoresRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StoresRecord.fromSnapshot(s));

  static StoresRecord fromSnapshot(DocumentSnapshot snapshot) => StoresRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StoresRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StoresRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StoresRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StoresRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStoresRecordData({
  String? storeName,
  DocumentReference? user,
  String? address,
  String? phone,
  String? room,
  bool? itsCoupang,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'storeName': storeName,
      'user': user,
      'address': address,
      'phone': phone,
      'room': room,
      'itsCoupang': itsCoupang,
    }.withoutNulls,
  );

  return firestoreData;
}

class StoresRecordDocumentEquality implements Equality<StoresRecord> {
  const StoresRecordDocumentEquality();

  @override
  bool equals(StoresRecord? e1, StoresRecord? e2) {
    return e1?.storeName == e2?.storeName &&
        e1?.user == e2?.user &&
        e1?.address == e2?.address &&
        e1?.phone == e2?.phone &&
        e1?.room == e2?.room &&
        e1?.itsCoupang == e2?.itsCoupang;
  }

  @override
  int hash(StoresRecord? e) => const ListEquality().hash(
      [e?.storeName, e?.user, e?.address, e?.phone, e?.room, e?.itsCoupang]);

  @override
  bool isValidKey(Object? o) => o is StoresRecord;
}
