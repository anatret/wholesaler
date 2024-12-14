import '/components/order_item/order_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'one_order_page_widget.dart' show OneOrderPageWidget;
import 'package:flutter/material.dart';

class OneOrderPageModel extends FlutterFlowModel<OneOrderPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for OrderItem dynamic component.
  late FlutterFlowDynamicModels<OrderItemModel> orderItemModels;

  @override
  void initState(BuildContext context) {
    orderItemModels = FlutterFlowDynamicModels(() => OrderItemModel());
  }

  @override
  void dispose() {
    orderItemModels.dispose();
  }
}
