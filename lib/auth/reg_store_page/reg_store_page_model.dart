import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'reg_store_page_widget.dart' show RegStorePageWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegStorePageModel extends FlutterFlowModel<RegStorePageWidget> {
  ///  State fields for stateful widgets in this page.

  Completer<List<StoresRecord>>? firestoreRequestCompleter;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

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
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  StoresRecord? newStoreID;

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
  }

  /// Additional helper methods.
  Future waitForFirestoreRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
