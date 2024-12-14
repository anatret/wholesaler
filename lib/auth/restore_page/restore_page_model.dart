import '/flutter_flow/flutter_flow_util.dart';
import 'restore_page_widget.dart' show RestorePageWidget;
import 'package:flutter/material.dart';

class RestorePageModel extends FlutterFlowModel<RestorePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for EmailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldTextController;
  String? Function(BuildContext, String?)? emailFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailFieldFocusNode?.dispose();
    emailFieldTextController?.dispose();
  }
}
