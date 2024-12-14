import 'package:collection/collection.dart';

enum ProductType {
  pizza,
  snack,
  dessert,
  drinks,
  sauce,
  vodka,
  cannedfood,
  grocery,
  vine,
  cognac,
  cigarettes,
}

enum UserTypes {
  user,
  manager,
  admin,
}

enum Productsize {
  small,
  medium,
  large,
}

enum OrderStatus {
  newOrder,
  confirmed,
  completed,
  canceled,
}

enum AddressType {
  home,
  myStore,
  job,
  other,
}

enum ClientStatus {
  newClient,
  accepted,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (ProductType):
      return ProductType.values.deserialize(value) as T?;
    case (UserTypes):
      return UserTypes.values.deserialize(value) as T?;
    case (Productsize):
      return Productsize.values.deserialize(value) as T?;
    case (OrderStatus):
      return OrderStatus.values.deserialize(value) as T?;
    case (AddressType):
      return AddressType.values.deserialize(value) as T?;
    case (ClientStatus):
      return ClientStatus.values.deserialize(value) as T?;
    default:
      return null;
  }
}
