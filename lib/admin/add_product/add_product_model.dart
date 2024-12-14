import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_product_widget.dart' show AddProductWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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
  // State field(s) for discriptionProductField widget.
  FocusNode? discriptionProductFieldFocusNode;
  TextEditingController? discriptionProductFieldTextController;
  String? Function(BuildContext, String?)?
      discriptionProductFieldTextControllerValidator;
  // State field(s) for ingredientsProductField widget.
  FocusNode? ingredientsProductFieldFocusNode;
  TextEditingController? ingredientsProductFieldTextController;
  String? Function(BuildContext, String?)?
      ingredientsProductFieldTextControllerValidator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for priceMinField widget.
  FocusNode? priceMinFieldFocusNode;
  TextEditingController? priceMinFieldTextController;
  final priceMinFieldMask = MaskTextInputFormatter(mask: '### ###');
  String? Function(BuildContext, String?)? priceMinFieldTextControllerValidator;
  // State field(s) for weightMinField widget.
  FocusNode? weightMinFieldFocusNode;
  TextEditingController? weightMinFieldTextController;
  final weightMinFieldMask = MaskTextInputFormatter(mask: '### ###');
  String? Function(BuildContext, String?)?
      weightMinFieldTextControllerValidator;
  // State field(s) for priceMedField widget.
  FocusNode? priceMedFieldFocusNode;
  TextEditingController? priceMedFieldTextController;
  final priceMedFieldMask = MaskTextInputFormatter(mask: '### ###');
  String? Function(BuildContext, String?)? priceMedFieldTextControllerValidator;
  // State field(s) for weightMedField widget.
  FocusNode? weightMedFieldFocusNode;
  TextEditingController? weightMedFieldTextController;
  final weightMedFieldMask = MaskTextInputFormatter(mask: '### ###');
  String? Function(BuildContext, String?)?
      weightMedFieldTextControllerValidator;
  // State field(s) for priceMaxField widget.
  FocusNode? priceMaxFieldFocusNode;
  TextEditingController? priceMaxFieldTextController;
  final priceMaxFieldMask = MaskTextInputFormatter(mask: '### ###');
  String? Function(BuildContext, String?)? priceMaxFieldTextControllerValidator;
  // State field(s) for weightMaxField widget.
  FocusNode? weightMaxFieldFocusNode;
  TextEditingController? weightMaxFieldTextController;
  final weightMaxFieldMask = MaskTextInputFormatter(mask: '### ###');
  String? Function(BuildContext, String?)?
      weightMaxFieldTextControllerValidator;
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

    discriptionProductFieldFocusNode?.dispose();
    discriptionProductFieldTextController?.dispose();

    ingredientsProductFieldFocusNode?.dispose();
    ingredientsProductFieldTextController?.dispose();

    priceMinFieldFocusNode?.dispose();
    priceMinFieldTextController?.dispose();

    weightMinFieldFocusNode?.dispose();
    weightMinFieldTextController?.dispose();

    priceMedFieldFocusNode?.dispose();
    priceMedFieldTextController?.dispose();

    weightMedFieldFocusNode?.dispose();
    weightMedFieldTextController?.dispose();

    priceMaxFieldFocusNode?.dispose();
    priceMaxFieldTextController?.dispose();

    weightMaxFieldFocusNode?.dispose();
    weightMaxFieldTextController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
