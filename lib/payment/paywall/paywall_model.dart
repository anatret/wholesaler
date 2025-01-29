import '/components/fab/fab/fab_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'paywall_widget.dart' show PaywallWidget;
import 'package:flutter/material.dart';

class PaywallModel extends FlutterFlowModel<PaywallWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for FAB component.
  late FabModel fabModel;

  @override
  void initState(BuildContext context) {
    fabModel = createModel(context, () => FabModel());
  }

  @override
  void dispose() {
    fabModel.dispose();
  }
}
