import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StoresRecord extends FirestoreRecord {
  StoresRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
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

  // "saobcha" field.
  String? _saobcha;
  String get saobcha => _saobcha ?? '';
  bool hasSaobcha() => _saobcha != null;

  // "saobchaImg" field.
  String? _saobchaImg;
  String get saobchaImg => _saobchaImg ?? '';
  bool hasSaobchaImg() => _saobchaImg != null;

  // "logoImg" field.
  String? _logoImg;
  String get logoImg => _logoImg ?? '';
  bool hasLogoImg() => _logoImg != null;

  // "verifyStatus" field.
  VerifyStatus? _verifyStatus;
  VerifyStatus? get verifyStatus => _verifyStatus;
  bool hasVerifyStatus() => _verifyStatus != null;

  // "isWholeStore" field.
  bool? _isWholeStore;
  bool get isWholeStore => _isWholeStore ?? false;
  bool hasIsWholeStore() => _isWholeStore != null;

  void _initializeFields() {
    _storeName = snapshotData['storeName'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _address = snapshotData['address'] as String?;
    _phone = snapshotData['phone'] as String?;
    _room = snapshotData['room'] as String?;
    _itsCoupang = snapshotData['itsCoupang'] as bool?;
    _saobcha = snapshotData['saobcha'] as String?;
    _saobchaImg = snapshotData['saobchaImg'] as String?;
    _logoImg = snapshotData['logoImg'] as String?;
    _verifyStatus = snapshotData['verifyStatus'] is VerifyStatus
        ? snapshotData['verifyStatus']
        : deserializeEnum<VerifyStatus>(snapshotData['verifyStatus']);
    _isWholeStore = snapshotData['isWholeStore'] as bool?;
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

  static StoresRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      StoresRecord.getDocumentFromData(
        {
          'storeName': snapshot.data['storeName'],
          'user': convertAlgoliaParam(
            snapshot.data['user'],
            ParamType.DocumentReference,
            false,
          ),
          'address': snapshot.data['address'],
          'phone': snapshot.data['phone'],
          'room': snapshot.data['room'],
          'itsCoupang': snapshot.data['itsCoupang'],
          'saobcha': snapshot.data['saobcha'],
          'saobchaImg': snapshot.data['saobchaImg'],
          'logoImg': snapshot.data['logoImg'],
          'verifyStatus': convertAlgoliaParam<VerifyStatus>(
            snapshot.data['verifyStatus'],
            ParamType.Enum,
            false,
          ),
          'isWholeStore': snapshot.data['isWholeStore'],
        },
        StoresRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<StoresRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'stores',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

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
  String? saobcha,
  String? saobchaImg,
  String? logoImg,
  VerifyStatus? verifyStatus,
  bool? isWholeStore,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'storeName': storeName,
      'user': user,
      'address': address,
      'phone': phone,
      'room': room,
      'itsCoupang': itsCoupang,
      'saobcha': saobcha,
      'saobchaImg': saobchaImg,
      'logoImg': logoImg,
      'verifyStatus': verifyStatus,
      'isWholeStore': isWholeStore,
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
        e1?.itsCoupang == e2?.itsCoupang &&
        e1?.saobcha == e2?.saobcha &&
        e1?.saobchaImg == e2?.saobchaImg &&
        e1?.logoImg == e2?.logoImg &&
        e1?.verifyStatus == e2?.verifyStatus &&
        e1?.isWholeStore == e2?.isWholeStore;
  }

  @override
  int hash(StoresRecord? e) => const ListEquality().hash([
        e?.storeName,
        e?.user,
        e?.address,
        e?.phone,
        e?.room,
        e?.itsCoupang,
        e?.saobcha,
        e?.saobchaImg,
        e?.logoImg,
        e?.verifyStatus,
        e?.isWholeStore
      ]);

  @override
  bool isValidKey(Object? o) => o is StoresRecord;
}
