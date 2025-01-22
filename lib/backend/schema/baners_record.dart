import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
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

  // "storeRef" field.
  DocumentReference? _storeRef;
  DocumentReference? get storeRef => _storeRef;
  bool hasStoreRef() => _storeRef != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _url = snapshotData['url'] as String?;
    _storeRef = snapshotData['storeRef'] as DocumentReference?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
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

  static BanersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      BanersRecord.getDocumentFromData(
        {
          'url': snapshot.data['url'],
          'storeRef': convertAlgoliaParam(
            snapshot.data['storeRef'],
            ParamType.DocumentReference,
            false,
          ),
          'userRef': convertAlgoliaParam(
            snapshot.data['userRef'],
            ParamType.DocumentReference,
            false,
          ),
        },
        BanersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<BanersRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'baners',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

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
  DocumentReference? storeRef,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'url': url,
      'storeRef': storeRef,
      'userRef': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class BanersRecordDocumentEquality implements Equality<BanersRecord> {
  const BanersRecordDocumentEquality();

  @override
  bool equals(BanersRecord? e1, BanersRecord? e2) {
    return e1?.url == e2?.url &&
        e1?.storeRef == e2?.storeRef &&
        e1?.userRef == e2?.userRef;
  }

  @override
  int hash(BanersRecord? e) =>
      const ListEquality().hash([e?.url, e?.storeRef, e?.userRef]);

  @override
  bool isValidKey(Object? o) => o is BanersRecord;
}
