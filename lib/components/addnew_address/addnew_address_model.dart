import '/flutter_flow/flutter_flow_util.dart';
import 'addnew_address_widget.dart' show AddnewAddressWidget;
import 'package:flutter/material.dart';

class AddnewAddressModel extends FlutterFlowModel<AddnewAddressWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for SityField widget.
  FocusNode? sityFieldFocusNode;
  TextEditingController? sityFieldTextController;
  String? Function(BuildContext, String?)? sityFieldTextControllerValidator;
  // State field(s) for StreetField widget.
  FocusNode? streetFieldFocusNode;
  TextEditingController? streetFieldTextController;
  String? Function(BuildContext, String?)? streetFieldTextControllerValidator;
  // State field(s) for homeField widget.
  FocusNode? homeFieldFocusNode;
  TextEditingController? homeFieldTextController;
  String? Function(BuildContext, String?)? homeFieldTextControllerValidator;
  // State field(s) for apartField widget.
  FocusNode? apartFieldFocusNode;
  TextEditingController? apartFieldTextController;
  String? Function(BuildContext, String?)? apartFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    sityFieldFocusNode?.dispose();
    sityFieldTextController?.dispose();

    streetFieldFocusNode?.dispose();
    streetFieldTextController?.dispose();

    homeFieldFocusNode?.dispose();
    homeFieldTextController?.dispose();

    apartFieldFocusNode?.dispose();
    apartFieldTextController?.dispose();
  }
}
