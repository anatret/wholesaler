import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentsRecord extends FirestoreRecord {
  PaymentsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userref" field.
  DocumentReference? _userref;
  DocumentReference? get userref => _userref;
  bool hasUserref() => _userref != null;

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  bool hasAmount() => _amount != null;

  // "card_number" field.
  String? _cardNumber;
  String get cardNumber => _cardNumber ?? '';
  bool hasCardNumber() => _cardNumber != null;

  // "buyer_email" field.
  String? _buyerEmail;
  String get buyerEmail => _buyerEmail ?? '';
  bool hasBuyerEmail() => _buyerEmail != null;

  // "tarifPlan" field.
  String? _tarifPlan;
  String get tarifPlan => _tarifPlan ?? '';
  bool hasTarifPlan() => _tarifPlan != null;

  // "merchantUID" field.
  String? _merchantUID;
  String get merchantUID => _merchantUID ?? '';
  bool hasMerchantUID() => _merchantUID != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "imp_uid" field.
  String? _impUid;
  String get impUid => _impUid ?? '';
  bool hasImpUid() => _impUid != null;

  // "pay_method" field.
  String? _payMethod;
  String get payMethod => _payMethod ?? '';
  bool hasPayMethod() => _payMethod != null;

  // "receipt_url" field.
  String? _receiptUrl;
  String get receiptUrl => _receiptUrl ?? '';
  bool hasReceiptUrl() => _receiptUrl != null;

  // "responceCode" field.
  String? _responceCode;
  String get responceCode => _responceCode ?? '';
  bool hasResponceCode() => _responceCode != null;

  // "cancel_receipt_urls" field.
  List<String>? _cancelReceiptUrls;
  List<String> get cancelReceiptUrls => _cancelReceiptUrls ?? const [];
  bool hasCancelReceiptUrls() => _cancelReceiptUrls != null;

  // "pg_tid" field.
  String? _pgTid;
  String get pgTid => _pgTid ?? '';
  bool hasPgTid() => _pgTid != null;

  // "pg_id" field.
  String? _pgId;
  String get pgId => _pgId ?? '';
  bool hasPgId() => _pgId != null;

  // "pg_provider" field.
  String? _pgProvider;
  String get pgProvider => _pgProvider ?? '';
  bool hasPgProvider() => _pgProvider != null;

  // "card_name" field.
  String? _cardName;
  String get cardName => _cardName ?? '';
  bool hasCardName() => _cardName != null;

  void _initializeFields() {
    _userref = snapshotData['userref'] as DocumentReference?;
    _amount = castToType<int>(snapshotData['amount']);
    _cardNumber = snapshotData['card_number'] as String?;
    _buyerEmail = snapshotData['buyer_email'] as String?;
    _tarifPlan = snapshotData['tarifPlan'] as String?;
    _merchantUID = snapshotData['merchantUID'] as String?;
    _message = snapshotData['message'] as String?;
    _impUid = snapshotData['imp_uid'] as String?;
    _payMethod = snapshotData['pay_method'] as String?;
    _receiptUrl = snapshotData['receipt_url'] as String?;
    _responceCode = snapshotData['responceCode'] as String?;
    _cancelReceiptUrls = getDataList(snapshotData['cancel_receipt_urls']);
    _pgTid = snapshotData['pg_tid'] as String?;
    _pgId = snapshotData['pg_id'] as String?;
    _pgProvider = snapshotData['pg_provider'] as String?;
    _cardName = snapshotData['card_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('payments');

  static Stream<PaymentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentsRecord.fromSnapshot(s));

  static Future<PaymentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymentsRecord.fromSnapshot(s));

  static PaymentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentsRecord._(reference, mapFromFirestore(data));

  static PaymentsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      PaymentsRecord.getDocumentFromData(
        {
          'userref': convertAlgoliaParam(
            snapshot.data['userref'],
            ParamType.DocumentReference,
            false,
          ),
          'amount': convertAlgoliaParam(
            snapshot.data['amount'],
            ParamType.int,
            false,
          ),
          'card_number': snapshot.data['card_number'],
          'buyer_email': snapshot.data['buyer_email'],
          'tarifPlan': snapshot.data['tarifPlan'],
          'merchantUID': snapshot.data['merchantUID'],
          'message': snapshot.data['message'],
          'imp_uid': snapshot.data['imp_uid'],
          'pay_method': snapshot.data['pay_method'],
          'receipt_url': snapshot.data['receipt_url'],
          'responceCode': snapshot.data['responceCode'],
          'cancel_receipt_urls': safeGet(
            () => snapshot.data['cancel_receipt_urls'].toList(),
          ),
          'pg_tid': snapshot.data['pg_tid'],
          'pg_id': snapshot.data['pg_id'],
          'pg_provider': snapshot.data['pg_provider'],
          'card_name': snapshot.data['card_name'],
        },
        PaymentsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<PaymentsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'payments',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'PaymentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaymentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaymentsRecordData({
  DocumentReference? userref,
  int? amount,
  String? cardNumber,
  String? buyerEmail,
  String? tarifPlan,
  String? merchantUID,
  String? message,
  String? impUid,
  String? payMethod,
  String? receiptUrl,
  String? responceCode,
  String? pgTid,
  String? pgId,
  String? pgProvider,
  String? cardName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userref': userref,
      'amount': amount,
      'card_number': cardNumber,
      'buyer_email': buyerEmail,
      'tarifPlan': tarifPlan,
      'merchantUID': merchantUID,
      'message': message,
      'imp_uid': impUid,
      'pay_method': payMethod,
      'receipt_url': receiptUrl,
      'responceCode': responceCode,
      'pg_tid': pgTid,
      'pg_id': pgId,
      'pg_provider': pgProvider,
      'card_name': cardName,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaymentsRecordDocumentEquality implements Equality<PaymentsRecord> {
  const PaymentsRecordDocumentEquality();

  @override
  bool equals(PaymentsRecord? e1, PaymentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userref == e2?.userref &&
        e1?.amount == e2?.amount &&
        e1?.cardNumber == e2?.cardNumber &&
        e1?.buyerEmail == e2?.buyerEmail &&
        e1?.tarifPlan == e2?.tarifPlan &&
        e1?.merchantUID == e2?.merchantUID &&
        e1?.message == e2?.message &&
        e1?.impUid == e2?.impUid &&
        e1?.payMethod == e2?.payMethod &&
        e1?.receiptUrl == e2?.receiptUrl &&
        e1?.responceCode == e2?.responceCode &&
        listEquality.equals(e1?.cancelReceiptUrls, e2?.cancelReceiptUrls) &&
        e1?.pgTid == e2?.pgTid &&
        e1?.pgId == e2?.pgId &&
        e1?.pgProvider == e2?.pgProvider &&
        e1?.cardName == e2?.cardName;
  }

  @override
  int hash(PaymentsRecord? e) => const ListEquality().hash([
        e?.userref,
        e?.amount,
        e?.cardNumber,
        e?.buyerEmail,
        e?.tarifPlan,
        e?.merchantUID,
        e?.message,
        e?.impUid,
        e?.payMethod,
        e?.receiptUrl,
        e?.responceCode,
        e?.cancelReceiptUrls,
        e?.pgTid,
        e?.pgId,
        e?.pgProvider,
        e?.cardName
      ]);

  @override
  bool isValidKey(Object? o) => o is PaymentsRecord;
}
