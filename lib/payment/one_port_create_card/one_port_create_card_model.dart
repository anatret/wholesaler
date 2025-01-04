import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'one_port_create_card_widget.dart' show OnePortCreateCardWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class OnePortCreateCardModel extends FlutterFlowModel<OnePortCreateCardWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextFieldCardNum widget.
  FocusNode? textFieldCardNumFocusNode;
  TextEditingController? textFieldCardNumTextController;
  final textFieldCardNumMask =
      MaskTextInputFormatter(mask: '####-####-####-####');
  String? Function(BuildContext, String?)?
      textFieldCardNumTextControllerValidator;
  // State field(s) for TextFieldExpiryDate widget.
  FocusNode? textFieldExpiryDateFocusNode;
  TextEditingController? textFieldExpiryDateTextController;
  final textFieldExpiryDateMask = MaskTextInputFormatter(mask: '####-##');
  String? Function(BuildContext, String?)?
      textFieldExpiryDateTextControllerValidator;
  // State field(s) for TextFieldCVV widget.
  FocusNode? textFieldCVVFocusNode;
  TextEditingController? textFieldCVVTextController;
  final textFieldCVVMask = MaskTextInputFormatter(mask: '###');
  String? Function(BuildContext, String?)? textFieldCVVTextControllerValidator;
  // State field(s) for TextFieldPassword widget.
  FocusNode? textFieldPasswordFocusNode;
  TextEditingController? textFieldPasswordTextController;
  final textFieldPasswordMask = MaskTextInputFormatter(mask: '##');
  String? Function(BuildContext, String?)?
      textFieldPasswordTextControllerValidator;
  // State field(s) for TextFieldCardholderName widget.
  FocusNode? textFieldCardholderNameFocusNode;
  TextEditingController? textFieldCardholderNameTextController;
  String? Function(BuildContext, String?)?
      textFieldCardholderNameTextControllerValidator;
  // State field(s) for TextFieldBirthday widget.
  FocusNode? textFieldBirthdayFocusNode;
  TextEditingController? textFieldBirthdayTextController;
  final textFieldBirthdayMask = MaskTextInputFormatter(mask: '######');
  String? Function(BuildContext, String?)?
      textFieldBirthdayTextControllerValidator;
  // State field(s) for TextFieldEmail widget.
  FocusNode? textFieldEmailFocusNode;
  TextEditingController? textFieldEmailTextController;
  String? Function(BuildContext, String?)?
      textFieldEmailTextControllerValidator;
  // State field(s) for TextFieldAmount widget.
  FocusNode? textFieldAmountFocusNode;
  TextEditingController? textFieldAmountTextController;
  String? Function(BuildContext, String?)?
      textFieldAmountTextControllerValidator;
  // State field(s) for TextFieldPlanName widget.
  FocusNode? textFieldPlanNameFocusNode;
  TextEditingController? textFieldPlanNameTextController;
  String? Function(BuildContext, String?)?
      textFieldPlanNameTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PaymentsRecord? newPaymantID;
  // Stores action output result for [Backend Call - API (getAccessToken)] action in Button widget.
  ApiCallResponse? getAccessToken;
  // Stores action output result for [Backend Call - API (onetimePayment)] action in Button widget.
  ApiCallResponse? paymentResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldCardNumFocusNode?.dispose();
    textFieldCardNumTextController?.dispose();

    textFieldExpiryDateFocusNode?.dispose();
    textFieldExpiryDateTextController?.dispose();

    textFieldCVVFocusNode?.dispose();
    textFieldCVVTextController?.dispose();

    textFieldPasswordFocusNode?.dispose();
    textFieldPasswordTextController?.dispose();

    textFieldCardholderNameFocusNode?.dispose();
    textFieldCardholderNameTextController?.dispose();

    textFieldBirthdayFocusNode?.dispose();
    textFieldBirthdayTextController?.dispose();

    textFieldEmailFocusNode?.dispose();
    textFieldEmailTextController?.dispose();

    textFieldAmountFocusNode?.dispose();
    textFieldAmountTextController?.dispose();

    textFieldPlanNameFocusNode?.dispose();
    textFieldPlanNameTextController?.dispose();
  }
}
