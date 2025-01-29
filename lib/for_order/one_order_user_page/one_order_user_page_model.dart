import '/backend/backend.dart';
import '/components/order_item/order_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'one_order_user_page_widget.dart' show OneOrderUserPageWidget;
import 'package:flutter/material.dart';

class OneOrderUserPageModel extends FlutterFlowModel<OneOrderUserPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for OrderItem dynamic component.
  late FlutterFlowDynamicModels<OrderItemModel> orderItemModels;
  // Stores action output result for [Backend Call - Read Document] action in FloatingActionButton widget.
  StoresRecord? wholestore;

  @override
  void initState(BuildContext context) {
    orderItemModels = FlutterFlowDynamicModels(() => OrderItemModel());
  }

  @override
  void dispose() {
    orderItemModels.dispose();
  }
}
