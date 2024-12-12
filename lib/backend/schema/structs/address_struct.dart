// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AddressStruct extends FFFirebaseStruct {
  AddressStruct({
    String? city,
    String? street,
    String? building,
    String? apart,
    AddressType? addressType,
    String? addressName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _city = city,
        _street = street,
        _building = building,
        _apart = apart,
        _addressType = addressType,
        _addressName = addressName,
        super(firestoreUtilData);

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "street" field.
  String? _street;
  String get street => _street ?? '';
  set street(String? val) => _street = val;

  bool hasStreet() => _street != null;

  // "building" field.
  String? _building;
  String get building => _building ?? '';
  set building(String? val) => _building = val;

  bool hasBuilding() => _building != null;

  // "apart" field.
  String? _apart;
  String get apart => _apart ?? '-';
  set apart(String? val) => _apart = val;

  bool hasApart() => _apart != null;

  // "addressType" field.
  AddressType? _addressType;
  AddressType get addressType => _addressType ?? AddressType.other;
  set addressType(AddressType? val) => _addressType = val;

  bool hasAddressType() => _addressType != null;

  // "addressName" field.
  String? _addressName;
  String get addressName => _addressName ?? '';
  set addressName(String? val) => _addressName = val;

  bool hasAddressName() => _addressName != null;

  static AddressStruct fromMap(Map<String, dynamic> data) => AddressStruct(
        city: data['city'] as String?,
        street: data['street'] as String?,
        building: data['building'] as String?,
        apart: data['apart'] as String?,
        addressType: data['addressType'] is AddressType
            ? data['addressType']
            : deserializeEnum<AddressType>(data['addressType']),
        addressName: data['addressName'] as String?,
      );

  static AddressStruct? maybeFromMap(dynamic data) =>
      data is Map ? AddressStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'city': _city,
        'street': _street,
        'building': _building,
        'apart': _apart,
        'addressType': _addressType?.serialize(),
        'addressName': _addressName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'street': serializeParam(
          _street,
          ParamType.String,
        ),
        'building': serializeParam(
          _building,
          ParamType.String,
        ),
        'apart': serializeParam(
          _apart,
          ParamType.String,
        ),
        'addressType': serializeParam(
          _addressType,
          ParamType.Enum,
        ),
        'addressName': serializeParam(
          _addressName,
          ParamType.String,
        ),
      }.withoutNulls;

  static AddressStruct fromSerializableMap(Map<String, dynamic> data) =>
      AddressStruct(
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        street: deserializeParam(
          data['street'],
          ParamType.String,
          false,
        ),
        building: deserializeParam(
          data['building'],
          ParamType.String,
          false,
        ),
        apart: deserializeParam(
          data['apart'],
          ParamType.String,
          false,
        ),
        addressType: deserializeParam<AddressType>(
          data['addressType'],
          ParamType.Enum,
          false,
        ),
        addressName: deserializeParam(
          data['addressName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AddressStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AddressStruct &&
        city == other.city &&
        street == other.street &&
        building == other.building &&
        apart == other.apart &&
        addressType == other.addressType &&
        addressName == other.addressName;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([city, street, building, apart, addressType, addressName]);
}

AddressStruct createAddressStruct({
  String? city,
  String? street,
  String? building,
  String? apart,
  AddressType? addressType,
  String? addressName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AddressStruct(
      city: city,
      street: street,
      building: building,
      apart: apart,
      addressType: addressType,
      addressName: addressName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AddressStruct? updateAddressStruct(
  AddressStruct? address, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    address
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAddressStructData(
  Map<String, dynamic> firestoreData,
  AddressStruct? address,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (address == null) {
    return;
  }
  if (address.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && address.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final addressData = getAddressFirestoreData(address, forFieldValue);
  final nestedData = addressData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = address.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAddressFirestoreData(
  AddressStruct? address, [
  bool forFieldValue = false,
]) {
  if (address == null) {
    return {};
  }
  final firestoreData = mapToFirestore(address.toMap());

  // Add any Firestore field values
  address.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAddressListFirestoreData(
  List<AddressStruct>? addresss,
) =>
    addresss?.map((e) => getAddressFirestoreData(e, true)).toList() ?? [];
