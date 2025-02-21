import '/flutter_flow/flutter_flow_util.dart';
import 'check_store_page_admin_widget.dart' show CheckStorePageAdminWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CheckStorePageAdminModel
    extends FlutterFlowModel<CheckStorePageAdminWidget> {
  ///  Local state fields for this page.

  bool statusIsTrue = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldTextController;
  String? Function(BuildContext, String?)? nameFieldTextControllerValidator;
  // State field(s) for PhoneField widget.
  FocusNode? phoneFieldFocusNode;
  TextEditingController? phoneFieldTextController;
  final phoneFieldMask = MaskTextInputFormatter(mask: '###-####-####');
  String? Function(BuildContext, String?)? phoneFieldTextControllerValidator;
  // State field(s) for AddressStore widget.
  FocusNode? addressStoreFocusNode;
  TextEditingController? addressStoreTextController;
  String? Function(BuildContext, String?)? addressStoreTextControllerValidator;
  // State field(s) for roomStore widget.
  FocusNode? roomStoreFocusNode;
  TextEditingController? roomStoreTextController;
  String? Function(BuildContext, String?)? roomStoreTextControllerValidator;
  // State field(s) for saobcha widget.
  FocusNode? saobchaFocusNode;
  TextEditingController? saobchaTextController;
  String? Function(BuildContext, String?)? saobchaTextControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFieldFocusNode?.dispose();
    nameFieldTextController?.dispose();

    phoneFieldFocusNode?.dispose();
    phoneFieldTextController?.dispose();

    addressStoreFocusNode?.dispose();
    addressStoreTextController?.dispose();

    roomStoreFocusNode?.dispose();
    roomStoreTextController?.dispose();

    saobchaFocusNode?.dispose();
    saobchaTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController6?.dispose();
  }
}
