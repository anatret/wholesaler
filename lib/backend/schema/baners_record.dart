import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BanersRecord extends FirestoreRecord {
  BanersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
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

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "body" field.
  String? _body;
  String get body => _body ?? '';
  bool hasBody() => _body != null;

  // "products" field.
  List<DocumentReference>? _products;
  List<DocumentReference> get products => _products ?? const [];
  bool hasProducts() => _products != null;

  // "url2" field.
  String? _url2;
  String get url2 => _url2 ?? '';
  bool hasUrl2() => _url2 != null;

  // "inAction" field.
  bool? _inAction;
  bool get inAction => _inAction ?? false;
  bool hasInAction() => _inAction != null;

  // "creatTime" field.
  DateTime? _creatTime;
  DateTime? get creatTime => _creatTime;
  bool hasCreatTime() => _creatTime != null;

  void _initializeFields() {
    _url = snapshotData['url'] as String?;
    _storeRef = snapshotData['storeRef'] as DocumentReference?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _body = snapshotData['body'] as String?;
    _products = getDataList(snapshotData['products']);
    _url2 = snapshotData['url2'] as String?;
    _inAction = snapshotData['inAction'] as bool?;
    _creatTime = snapshotData['creatTime'] as DateTime?;
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
          'title': snapshot.data['title'],
          'body': snapshot.data['body'],
          'products': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['products'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'url2': snapshot.data['url2'],
          'inAction': snapshot.data['inAction'],
          'creatTime': convertAlgoliaParam(
            snapshot.data['creatTime'],
            ParamType.DateTime,
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
  String? title,
  String? body,
  String? url2,
  bool? inAction,
  DateTime? creatTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'url': url,
      'storeRef': storeRef,
      'userRef': userRef,
      'title': title,
      'body': body,
      'url2': url2,
      'inAction': inAction,
      'creatTime': creatTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class BanersRecordDocumentEquality implements Equality<BanersRecord> {
  const BanersRecordDocumentEquality();

  @override
  bool equals(BanersRecord? e1, BanersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.url == e2?.url &&
        e1?.storeRef == e2?.storeRef &&
        e1?.userRef == e2?.userRef &&
        e1?.title == e2?.title &&
        e1?.body == e2?.body &&
        listEquality.equals(e1?.products, e2?.products) &&
        e1?.url2 == e2?.url2 &&
        e1?.inAction == e2?.inAction &&
        e1?.creatTime == e2?.creatTime;
  }

  @override
  int hash(BanersRecord? e) => const ListEquality().hash([
        e?.url,
        e?.storeRef,
        e?.userRef,
        e?.title,
        e?.body,
        e?.products,
        e?.url2,
        e?.inAction,
        e?.creatTime
      ]);

  @override
  bool isValidKey(Object? o) => o is BanersRecord;
}
