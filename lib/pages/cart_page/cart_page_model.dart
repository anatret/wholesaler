import '/components/cart_item/cart_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cart_page_widget.dart' show CartPageWidget;
import 'package:flutter/material.dart';

class CartPageModel extends FlutterFlowModel<CartPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for CartItem dynamic component.
  late FlutterFlowDynamicModels<CartItemModel> cartItemModels;

  @override
  void initState(BuildContext context) {
    cartItemModels = FlutterFlowDynamicModels(() => CartItemModel());
  }

  @override
  void dispose() {
    cartItemModels.dispose();
  }
}
