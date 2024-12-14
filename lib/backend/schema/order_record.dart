import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderRecord extends FirestoreRecord {
  OrderRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "numOrder" field.
  int? _numOrder;
  int get numOrder => _numOrder ?? 0;
  bool hasNumOrder() => _numOrder != null;

  // "createDate" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "cart" field.
  List<CartStruct>? _cart;
  List<CartStruct> get cart => _cart ?? const [];
  bool hasCart() => _cart != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "home" field.
  String? _home;
  String get home => _home ?? '';
  bool hasHome() => _home != null;

  // "room" field.
  String? _room;
  String get room => _room ?? '';
  bool hasRoom() => _room != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "typePay" field.
  String? _typePay;
  String get typePay => _typePay ?? '';
  bool hasTypePay() => _typePay != null;

  // "userOrder" field.
  DocumentReference? _userOrder;
  DocumentReference? get userOrder => _userOrder;
  bool hasUserOrder() => _userOrder != null;

  // "orderStatus" field.
  OrderStatus? _orderStatus;
  OrderStatus? get orderStatus => _orderStatus;
  bool hasOrderStatus() => _orderStatus != null;

  // "store" field.
  DocumentReference? _store;
  DocumentReference? get store => _store;
  bool hasStore() => _store != null;

  // "wholeStore" field.
  DocumentReference? _wholeStore;
  DocumentReference? get wholeStore => _wholeStore;
  bool hasWholeStore() => _wholeStore != null;

  void _initializeFields() {
    _numOrder = castToType<int>(snapshotData['numOrder']);
    _createDate = snapshotData['createDate'] as DateTime?;
    _cart = getStructList(
      snapshotData['cart'],
      CartStruct.fromMap,
    );
    _address = snapshotData['address'] as String?;
    _home = snapshotData['home'] as String?;
    _room = snapshotData['room'] as String?;
    _phone = snapshotData['phone'] as String?;
    _comment = snapshotData['comment'] as String?;
    _typePay = snapshotData['typePay'] as String?;
    _userOrder = snapshotData['userOrder'] as DocumentReference?;
    _orderStatus = snapshotData['orderStatus'] is OrderStatus
        ? snapshotData['orderStatus']
        : deserializeEnum<OrderStatus>(snapshotData['orderStatus']);
    _store = snapshotData['store'] as DocumentReference?;
    _wholeStore = snapshotData['wholeStore'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('order');

  static Stream<OrderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderRecord.fromSnapshot(s));

  static Future<OrderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderRecord.fromSnapshot(s));

  static OrderRecord fromSnapshot(DocumentSnapshot snapshot) => OrderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderRecordData({
  int? numOrder,
  DateTime? createDate,
  String? address,
  String? home,
  String? room,
  String? phone,
  String? comment,
  String? typePay,
  DocumentReference? userOrder,
  OrderStatus? orderStatus,
  DocumentReference? store,
  DocumentReference? wholeStore,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'numOrder': numOrder,
      'createDate': createDate,
      'address': address,
      'home': home,
      'room': room,
      'phone': phone,
      'comment': comment,
      'typePay': typePay,
      'userOrder': userOrder,
      'orderStatus': orderStatus,
      'store': store,
      'wholeStore': wholeStore,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrderRecordDocumentEquality implements Equality<OrderRecord> {
  const OrderRecordDocumentEquality();

  @override
  bool equals(OrderRecord? e1, OrderRecord? e2) {
    const listEquality = ListEquality();
    return e1?.numOrder == e2?.numOrder &&
        e1?.createDate == e2?.createDate &&
        listEquality.equals(e1?.cart, e2?.cart) &&
        e1?.address == e2?.address &&
        e1?.home == e2?.home &&
        e1?.room == e2?.room &&
        e1?.phone == e2?.phone &&
        e1?.comment == e2?.comment &&
        e1?.typePay == e2?.typePay &&
        e1?.userOrder == e2?.userOrder &&
        e1?.orderStatus == e2?.orderStatus &&
        e1?.store == e2?.store &&
        e1?.wholeStore == e2?.wholeStore;
  }

  @override
  int hash(OrderRecord? e) => const ListEquality().hash([
        e?.numOrder,
        e?.createDate,
        e?.cart,
        e?.address,
        e?.home,
        e?.room,
        e?.phone,
        e?.comment,
        e?.typePay,
        e?.userOrder,
        e?.orderStatus,
        e?.store,
        e?.wholeStore
      ]);

  @override
  bool isValidKey(Object? o) => o is OrderRecord;
}
