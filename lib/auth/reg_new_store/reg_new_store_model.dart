import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'reg_new_store_widget.dart' show RegNewStoreWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegNewStoreModel extends FlutterFlowModel<RegNewStoreWidget> {
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
        '725lx7p9' /* Имя магазина обязательно */,
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
        'etrgck0y' /* Номер телефона обязательно */,
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

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  StoresRecord? newStoreID;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UserRecord>? adminRefList;

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
