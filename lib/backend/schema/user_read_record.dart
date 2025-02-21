import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserReadRecord extends FirestoreRecord {
  UserReadRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "readingTime" field.
  DateTime? _readingTime;
  DateTime? get readingTime => _readingTime;
  bool hasReadingTime() => _readingTime != null;

  // "newsRef" field.
  DocumentReference? _newsRef;
  DocumentReference? get newsRef => _newsRef;
  bool hasNewsRef() => _newsRef != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _readingTime = snapshotData['readingTime'] as DateTime?;
    _newsRef = snapshotData['newsRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userRead');

  static Stream<UserReadRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserReadRecord.fromSnapshot(s));

  static Future<UserReadRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserReadRecord.fromSnapshot(s));

  static UserReadRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserReadRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserReadRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserReadRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserReadRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserReadRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserReadRecordData({
  DocumentReference? userRef,
  DateTime? readingTime,
  DocumentReference? newsRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'readingTime': readingTime,
      'newsRef': newsRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserReadRecordDocumentEquality implements Equality<UserReadRecord> {
  const UserReadRecordDocumentEquality();

  @override
  bool equals(UserReadRecord? e1, UserReadRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.readingTime == e2?.readingTime &&
        e1?.newsRef == e2?.newsRef;
  }

  @override
  int hash(UserReadRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.readingTime, e?.newsRef]);

  @override
  bool isValidKey(Object? o) => o is UserReadRecord;
}
