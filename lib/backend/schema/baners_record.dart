import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BanersRecord extends FirestoreRecord {
  BanersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  void _initializeFields() {
    _url = snapshotData['url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('baners');

  static Stream<BanersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BanersRecord.fromSnapshot(s));

  static Future<BanersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BanersRecord.fromSnapshot(s));

  static BanersRecord fromSnapshot(DocumentSnapshot snapshot) => BanersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BanersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BanersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BanersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BanersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBanersRecordData({
  String? url,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'url': url,
    }.withoutNulls,
  );

  return firestoreData;
}

class BanersRecordDocumentEquality implements Equality<BanersRecord> {
  const BanersRecordDocumentEquality();

  @override
  bool equals(BanersRecord? e1, BanersRecord? e2) {
    return e1?.url == e2?.url;
  }

  @override
  int hash(BanersRecord? e) => const ListEquality().hash([e?.url]);

  @override
  bool isValidKey(Object? o) => o is BanersRecord;
}
