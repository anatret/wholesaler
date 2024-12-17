import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_product_widget.dart' show AddProductWidget;
import 'package:flutter/material.dart';

class AddProductModel extends FlutterFlowModel<AddProductWidget> {
  ///  Local state fields for this page.

  List<String> ingList = [];
  void addToIngList(String item) => ingList.add(item);
  void removeFromIngList(String item) => ingList.remove(item);
  void removeAtIndexFromIngList(int index) => ingList.removeAt(index);
  void insertAtIndexInIngList(int index, String item) =>
      ingList.insert(index, item);
  void updateIngListAtIndex(int index, Function(String) updateFn) =>
      ingList[index] = updateFn(ingList[index]);

  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for priceProductField widget.
  FocusNode? priceProductFieldFocusNode;
  TextEditingController? priceProductFieldTextController;
  String? Function(BuildContext, String?)?
      priceProductFieldTextControllerValidator;
  // State field(s) for nameProductField widget.
  FocusNode? nameProductFieldFocusNode;
  TextEditingController? nameProductFieldTextController;
  String? Function(BuildContext, String?)?
      nameProductFieldTextControllerValidator;
  // State field(s) for barcodeProductField widget.
  FocusNode? barcodeProductFieldFocusNode;
  TextEditingController? barcodeProductFieldTextController;
  String? Function(BuildContext, String?)?
      barcodeProductFieldTextControllerValidator;
  // State field(s) for linckToProductField widget.
  FocusNode? linckToProductFieldFocusNode;
  TextEditingController? linckToProductFieldTextController;
  String? Function(BuildContext, String?)?
      linckToProductFieldTextControllerValidator;
  // State field(s) for discriptionProductField widget.
  FocusNode? discriptionProductFieldFocusNode;
  TextEditingController? discriptionProductFieldTextController;
  String? Function(BuildContext, String?)?
      discriptionProductFieldTextControllerValidator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for inStockSwitch widget.
  bool? inStockSwitchValue;
  // State field(s) for oftenOrderedSwitch widget.
  bool? oftenOrderedSwitchValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    priceProductFieldFocusNode?.dispose();
    priceProductFieldTextController?.dispose();

    nameProductFieldFocusNode?.dispose();
    nameProductFieldTextController?.dispose();

    barcodeProductFieldFocusNode?.dispose();
    barcodeProductFieldTextController?.dispose();

    linckToProductFieldFocusNode?.dispose();
    linckToProductFieldTextController?.dispose();

    discriptionProductFieldFocusNode?.dispose();
    discriptionProductFieldTextController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
