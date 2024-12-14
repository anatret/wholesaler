import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cart_item2_widget.dart' show CartItem2Widget;
import 'package:flutter/material.dart';

class CartItem2Model extends FlutterFlowModel<CartItem2Widget> {
  ///  Local state fields for this component.

  int value = 1;

  CartStruct? products;
  void updateProductsStruct(Function(CartStruct) updateFn) {
    updateFn(products ??= CartStruct());
  }

  List<CartStruct> order = [];
  void addToOrder(CartStruct item) => order.add(item);
  void removeFromOrder(CartStruct item) => order.remove(item);
  void removeAtIndexFromOrder(int index) => order.removeAt(index);
  void insertAtIndexInOrder(int index, CartStruct item) =>
      order.insert(index, item);
  void updateOrderAtIndex(int index, Function(CartStruct) updateFn) =>
      order[index] = updateFn(order[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
