import '/components/cart_item2/cart_item2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'one_order_manager_page_widget.dart' show OneOrderManagerPageWidget;
import 'package:flutter/material.dart';

class OneOrderManagerPageModel
    extends FlutterFlowModel<OneOrderManagerPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for CartItem2 dynamic component.
  late FlutterFlowDynamicModels<CartItem2Model> cartItem2Models;

  @override
  void initState(BuildContext context) {
    cartItem2Models = FlutterFlowDynamicModels(() => CartItem2Model());
  }

  @override
  void dispose() {
    cartItem2Models.dispose();
  }
}
