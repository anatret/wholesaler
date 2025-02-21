import '/flutter_flow/flutter_flow_util.dart';
import 'edit_store_page_widget.dart' show EditStorePageWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditStorePageModel extends FlutterFlowModel<EditStorePageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldTextController;
  String? Function(BuildContext, String?)? nameFieldTextControllerValidator;
  String? _nameFieldTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'yzzapdkd' /* Название магазина обязательно */,
      );
    }

    return null;
  }

  // State field(s) for PhoneField widget.
  FocusNode? phoneFieldFocusNode;
  TextEditingController? phoneFieldTextController;
  final phoneFieldMask = MaskTextInputFormatter(mask: '###-####-####');
  String? Function(BuildContext, String?)? phoneFieldTextControllerValidator;
  String? _phoneFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'wvbzqy00' /* Номер телефона обязательно */,
      );
    }

    return null;
  }

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
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {
    nameFieldTextControllerValidator = _nameFieldTextControllerValidator;
    phoneFieldTextControllerValidator = _phoneFieldTextControllerValidator;
  }

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
  }
}
