import '/components/check_store_card/check_store_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'check_store_list_widget.dart' show CheckStoreListWidget;
import 'package:flutter/material.dart';

class CheckStoreListModel extends FlutterFlowModel<CheckStoreListWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for checkStoreCard dynamic component.
  late FlutterFlowDynamicModels<CheckStoreCardModel> checkStoreCardModels;

  @override
  void initState(BuildContext context) {
    checkStoreCardModels =
        FlutterFlowDynamicModels(() => CheckStoreCardModel());
  }

  @override
  void dispose() {
    checkStoreCardModels.dispose();
  }
}
