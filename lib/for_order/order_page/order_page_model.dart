import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'order_page_widget.dart' show OrderPageWidget;
import 'package:flutter/material.dart';

class OrderPageModel extends FlutterFlowModel<OrderPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for AddressField widget.
  FocusNode? addressFieldFocusNode;
  TextEditingController? addressFieldTextController;
  String? Function(BuildContext, String?)? addressFieldTextControllerValidator;
  // State field(s) for HomeField widget.
  FocusNode? homeFieldFocusNode;
  TextEditingController? homeFieldTextController;
  String? Function(BuildContext, String?)? homeFieldTextControllerValidator;
  // State field(s) for RoomField widget.
  FocusNode? roomFieldFocusNode;
  TextEditingController? roomFieldTextController;
  String? Function(BuildContext, String?)? roomFieldTextControllerValidator;
  // State field(s) for PhoneField widget.
  FocusNode? phoneFieldFocusNode;
  TextEditingController? phoneFieldTextController;
  String? Function(BuildContext, String?)? phoneFieldTextControllerValidator;
  // State field(s) for CommentField widget.
  FocusNode? commentFieldFocusNode;
  TextEditingController? commentFieldTextController;
  String? Function(BuildContext, String?)? commentFieldTextControllerValidator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OrderRecord? newOrder;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    addressFieldFocusNode?.dispose();
    addressFieldTextController?.dispose();

    homeFieldFocusNode?.dispose();
    homeFieldTextController?.dispose();

    roomFieldFocusNode?.dispose();
    roomFieldTextController?.dispose();

    phoneFieldFocusNode?.dispose();
    phoneFieldTextController?.dispose();

    commentFieldFocusNode?.dispose();
    commentFieldTextController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
