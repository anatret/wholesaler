import '/flutter_flow/flutter_flow_util.dart';
import 'sand_notice_page_widget.dart' show SandNoticePageWidget;
import 'package:flutter/material.dart';

class SandNoticePageModel extends FlutterFlowModel<SandNoticePageWidget> {
  ///  Local state fields for this page.

  DateTime? dateTimeSand;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextFieldCardNum widget.
  FocusNode? textFieldCardNumFocusNode1;
  TextEditingController? textFieldCardNumTextController1;
  String? Function(BuildContext, String?)?
      textFieldCardNumTextController1Validator;
  // State field(s) for TextFieldCardNum widget.
  FocusNode? textFieldCardNumFocusNode2;
  TextEditingController? textFieldCardNumTextController2;
  String? Function(BuildContext, String?)?
      textFieldCardNumTextController2Validator;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldCardNumFocusNode1?.dispose();
    textFieldCardNumTextController1?.dispose();

    textFieldCardNumFocusNode2?.dispose();
    textFieldCardNumTextController2?.dispose();
  }
}
