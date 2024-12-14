import '/components/storeitem/storeitem_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'stores_widget.dart' show StoresWidget;
import 'package:flutter/material.dart';

class StoresModel extends FlutterFlowModel<StoresWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for storeitem dynamic component.
  late FlutterFlowDynamicModels<StoreitemModel> storeitemModels;

  @override
  void initState(BuildContext context) {
    storeitemModels = FlutterFlowDynamicModels(() => StoreitemModel());
  }

  @override
  void dispose() {
    storeitemModels.dispose();
  }
}
