import '/components/fab/fab/fab_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'test_page_widget.dart' show TestPageWidget;
import 'package:flutter/material.dart';

class TestPageModel extends FlutterFlowModel<TestPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
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

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
