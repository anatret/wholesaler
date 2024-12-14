import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PizzaRecord extends FirestoreRecord {
  PizzaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "productType" field.
  ProductType? _productType;
  ProductType? get productType => _productType;
  bool hasProductType() => _productType != null;

  // "ings" field.
  List<String>? _ings;
  List<String> get ings => _ings ?? const [];
  bool hasIngs() => _ings != null;

  // "priceMin" field.
  int? _priceMin;
  int get priceMin => _priceMin ?? 0;
  bool hasPriceMin() => _priceMin != null;

  // "weightMin" field.
  int? _weightMin;
  int get weightMin => _weightMin ?? 0;
  bool hasWeightMin() => _weightMin != null;

  // "priceMed" field.
  int? _priceMed;
  int get priceMed => _priceMed ?? 0;
  bool hasPriceMed() => _priceMed != null;

  // "priceMax" field.
  int? _priceMax;
  int get priceMax => _priceMax ?? 0;
  bool hasPriceMax() => _priceMax != null;

  // "weightMax" field.
  int? _weightMax;
  int get weightMax => _weightMax ?? 0;
  bool hasWeightMax() => _weightMax != null;

  // "weightMed" field.
  int? _weightMed;
  int get weightMed => _weightMed ?? 0;
  bool hasWeightMed() => _weightMed != null;

  // "inStock" field.
  bool? _inStock;
  bool get inStock => _inStock ?? false;
  bool hasInStock() => _inStock != null;

  // "oftenOrdered" field.
  bool? _oftenOrdered;
  bool get oftenOrdered => _oftenOrdered ?? false;
  bool hasOftenOrdered() => _oftenOrdered != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "barcode" field.
  String? _barcode;
  String get barcode => _barcode ?? '';
  bool hasBarcode() => _barcode != null;

  // "store" field.
  DocumentReference? _store;
  DocumentReference? get store => _store;
  bool hasStore() => _store != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _price = castToType<int>(snapshotData['price']);
    _img = snapshotData['img'] as String?;
    _productType = snapshotData['productType'] is ProductType
        ? snapshotData['productType']
        : deserializeEnum<ProductType>(snapshotData['productType']);
    _ings = getDataList(snapshotData['ings']);
    _priceMin = castToType<int>(snapshotData['priceMin']);
    _weightMin = castToType<int>(snapshotData['weightMin']);
    _priceMed = castToType<int>(snapshotData['priceMed']);
    _priceMax = castToType<int>(snapshotData['priceMax']);
    _weightMax = castToType<int>(snapshotData['weightMax']);
    _weightMed = castToType<int>(snapshotData['weightMed']);
    _inStock = snapshotData['inStock'] as bool?;
    _oftenOrdered = snapshotData['oftenOrdered'] as bool?;
    _isDeleted = snapshotData['isDeleted'] as bool?;
    _barcode = snapshotData['barcode'] as String?;
    _store = snapshotData['store'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pizza');

  static Stream<PizzaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PizzaRecord.fromSnapshot(s));

  static Future<PizzaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PizzaRecord.fromSnapshot(s));

  static PizzaRecord fromSnapshot(DocumentSnapshot snapshot) => PizzaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PizzaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PizzaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PizzaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PizzaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPizzaRecordData({
  String? name,
  String? description,
  int? price,
  String? img,
  ProductType? productType,
  int? priceMin,
  int? weightMin,
  int? priceMed,
  int? priceMax,
  int? weightMax,
  int? weightMed,
  bool? inStock,
  bool? oftenOrdered,
  bool? isDeleted,
  String? barcode,
  DocumentReference? store,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
      'img': img,
      'productType': productType,
      'priceMin': priceMin,
      'weightMin': weightMin,
      'priceMed': priceMed,
      'priceMax': priceMax,
      'weightMax': weightMax,
      'weightMed': weightMed,
      'inStock': inStock,
      'oftenOrdered': oftenOrdered,
      'isDeleted': isDeleted,
      'barcode': barcode,
      'store': store,
    }.withoutNulls,
  );

  return firestoreData;
}

class PizzaRecordDocumentEquality implements Equality<PizzaRecord> {
  const PizzaRecordDocumentEquality();

  @override
  bool equals(PizzaRecord? e1, PizzaRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.price == e2?.price &&
        e1?.img == e2?.img &&
        e1?.productType == e2?.productType &&
        listEquality.equals(e1?.ings, e2?.ings) &&
        e1?.priceMin == e2?.priceMin &&
        e1?.weightMin == e2?.weightMin &&
        e1?.priceMed == e2?.priceMed &&
        e1?.priceMax == e2?.priceMax &&
        e1?.weightMax == e2?.weightMax &&
        e1?.weightMed == e2?.weightMed &&
        e1?.inStock == e2?.inStock &&
        e1?.oftenOrdered == e2?.oftenOrdered &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.barcode == e2?.barcode &&
        e1?.store == e2?.store;
  }

  @override
  int hash(PizzaRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.price,
        e?.img,
        e?.productType,
        e?.ings,
        e?.priceMin,
        e?.weightMin,
        e?.priceMed,
        e?.priceMax,
        e?.weightMax,
        e?.weightMed,
        e?.inStock,
        e?.oftenOrdered,
        e?.isDeleted,
        e?.barcode,
        e?.store
      ]);

  @override
  bool isValidKey(Object? o) => o is PizzaRecord;
}
