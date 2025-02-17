import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewsRecord extends FirestoreRecord {
  NewsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "create_time" field.
  DateTime? _createTime;
  DateTime? get createTime => _createTime;
  bool hasCreateTime() => _createTime != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "body" field.
  String? _body;
  String get body => _body ?? '';
  bool hasBody() => _body != null;

  // "imgUrl" field.
  String? _imgUrl;
  String get imgUrl => _imgUrl ?? '';
  bool hasImgUrl() => _imgUrl != null;

  // "userSender" field.
  DocumentReference? _userSender;
  DocumentReference? get userSender => _userSender;
  bool hasUserSender() => _userSender != null;

  // "pageType" field.
  PageType? _pageType;
  PageType? get pageType => _pageType;
  bool hasPageType() => _pageType != null;

  // "prodRef" field.
  DocumentReference? _prodRef;
  DocumentReference? get prodRef => _prodRef;
  bool hasProdRef() => _prodRef != null;

  // "storeRef" field.
  DocumentReference? _storeRef;
  DocumentReference? get storeRef => _storeRef;
  bool hasStoreRef() => _storeRef != null;

  // "promotionRef" field.
  DocumentReference? _promotionRef;
  DocumentReference? get promotionRef => _promotionRef;
  bool hasPromotionRef() => _promotionRef != null;

  // "itsReady" field.
  bool? _itsReady;
  bool get itsReady => _itsReady ?? false;
  bool hasItsReady() => _itsReady != null;

  void _initializeFields() {
    _createTime = snapshotData['create_time'] as DateTime?;
    _title = snapshotData['title'] as String?;
    _body = snapshotData['body'] as String?;
    _imgUrl = snapshotData['imgUrl'] as String?;
    _userSender = snapshotData['userSender'] as DocumentReference?;
    _pageType = snapshotData['pageType'] is PageType
        ? snapshotData['pageType']
        : deserializeEnum<PageType>(snapshotData['pageType']);
    _prodRef = snapshotData['prodRef'] as DocumentReference?;
    _storeRef = snapshotData['storeRef'] as DocumentReference?;
    _promotionRef = snapshotData['promotionRef'] as DocumentReference?;
    _itsReady = snapshotData['itsReady'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('news');

  static Stream<NewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NewsRecord.fromSnapshot(s));

  static Future<NewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NewsRecord.fromSnapshot(s));

  static NewsRecord fromSnapshot(DocumentSnapshot snapshot) => NewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNewsRecordData({
  DateTime? createTime,
  String? title,
  String? body,
  String? imgUrl,
  DocumentReference? userSender,
  PageType? pageType,
  DocumentReference? prodRef,
  DocumentReference? storeRef,
  DocumentReference? promotionRef,
  bool? itsReady,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_time': createTime,
      'title': title,
      'body': body,
      'imgUrl': imgUrl,
      'userSender': userSender,
      'pageType': pageType,
      'prodRef': prodRef,
      'storeRef': storeRef,
      'promotionRef': promotionRef,
      'itsReady': itsReady,
    }.withoutNulls,
  );

  return firestoreData;
}

class NewsRecordDocumentEquality implements Equality<NewsRecord> {
  const NewsRecordDocumentEquality();

  @override
  bool equals(NewsRecord? e1, NewsRecord? e2) {
    return e1?.createTime == e2?.createTime &&
        e1?.title == e2?.title &&
        e1?.body == e2?.body &&
        e1?.imgUrl == e2?.imgUrl &&
        e1?.userSender == e2?.userSender &&
        e1?.pageType == e2?.pageType &&
        e1?.prodRef == e2?.prodRef &&
        e1?.storeRef == e2?.storeRef &&
        e1?.promotionRef == e2?.promotionRef &&
        e1?.itsReady == e2?.itsReady;
  }

  @override
  int hash(NewsRecord? e) => const ListEquality().hash([
        e?.createTime,
        e?.title,
        e?.body,
        e?.imgUrl,
        e?.userSender,
        e?.pageType,
        e?.prodRef,
        e?.storeRef,
        e?.promotionRef,
        e?.itsReady
      ]);

  @override
  bool isValidKey(Object? o) => o is NewsRecord;
}
