import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _cart = prefs
              .getStringList('ff_cart')
              ?.map((x) {
                try {
                  return CartStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _cart;
    });
    _safeInit(() {
      _favorits = prefs
              .getStringList('ff_favorits')
              ?.map((path) => path.ref)
              .toList() ??
          _favorits;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<CartStruct> _cart = [];
  List<CartStruct> get cart => _cart;
  set cart(List<CartStruct> value) {
    _cart = value;
    prefs.setStringList('ff_cart', value.map((x) => x.serialize()).toList());
  }

  void addToCart(CartStruct value) {
    cart.add(value);
    prefs.setStringList('ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  void removeFromCart(CartStruct value) {
    cart.remove(value);
    prefs.setStringList('ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCart(int index) {
    cart.removeAt(index);
    prefs.setStringList('ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  void updateCartAtIndex(
    int index,
    CartStruct Function(CartStruct) updateFn,
  ) {
    cart[index] = updateFn(_cart[index]);
    prefs.setStringList('ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCart(int index, CartStruct value) {
    cart.insert(index, value);
    prefs.setStringList('ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  List<DocumentReference> _favorits = [];
  List<DocumentReference> get favorits => _favorits;
  set favorits(List<DocumentReference> value) {
    _favorits = value;
    prefs.setStringList('ff_favorits', value.map((x) => x.path).toList());
  }

  void addToFavorits(DocumentReference value) {
    favorits.add(value);
    prefs.setStringList('ff_favorits', _favorits.map((x) => x.path).toList());
  }

  void removeFromFavorits(DocumentReference value) {
    favorits.remove(value);
    prefs.setStringList('ff_favorits', _favorits.map((x) => x.path).toList());
  }

  void removeAtIndexFromFavorits(int index) {
    favorits.removeAt(index);
    prefs.setStringList('ff_favorits', _favorits.map((x) => x.path).toList());
  }

  void updateFavoritsAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    favorits[index] = updateFn(_favorits[index]);
    prefs.setStringList('ff_favorits', _favorits.map((x) => x.path).toList());
  }

  void insertAtIndexInFavorits(int index, DocumentReference value) {
    favorits.insert(index, value);
    prefs.setStringList('ff_favorits', _favorits.map((x) => x.path).toList());
  }

  List<CartStruct> _orderForEdit = [];
  List<CartStruct> get orderForEdit => _orderForEdit;
  set orderForEdit(List<CartStruct> value) {
    _orderForEdit = value;
  }

  void addToOrderForEdit(CartStruct value) {
    orderForEdit.add(value);
  }

  void removeFromOrderForEdit(CartStruct value) {
    orderForEdit.remove(value);
  }

  void removeAtIndexFromOrderForEdit(int index) {
    orderForEdit.removeAt(index);
  }

  void updateOrderForEditAtIndex(
    int index,
    CartStruct Function(CartStruct) updateFn,
  ) {
    orderForEdit[index] = updateFn(_orderForEdit[index]);
  }

  void insertAtIndexInOrderForEdit(int index, CartStruct value) {
    orderForEdit.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
