import '/components/add_to_cart_count/add_to_cart_count_widget.dart';
import '/components/fab/f_a_b_prod_edit_for_admin/f_a_b_prod_edit_for_admin_widget.dart';
import '/components/fab/f_a_b_whole_store_page/f_a_b_whole_store_page_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'product_deck_page_widget.dart' show ProductDeckPageWidget;
import 'package:flutter/material.dart';

class ProductDeckPageModel extends FlutterFlowModel<ProductDeckPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  String? get choiceChipsValue1 =>
      choiceChipsValueController1?.value?.firstOrNull;
  set choiceChipsValue1(String? val) =>
      choiceChipsValueController1?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  String? get choiceChipsValue2 =>
      choiceChipsValueController2?.value?.firstOrNull;
  set choiceChipsValue2(String? val) =>
      choiceChipsValueController2?.value = val != null ? [val] : [];
  // Model for addToCartCount component.
  late AddToCartCountModel addToCartCountModel;
  // Model for FABProdEditForAdmin component.
  late FABProdEditForAdminModel fABProdEditForAdminModel;
  // Model for FABWholeStorePage component.
  late FABWholeStorePageModel fABWholeStorePageModel;

  @override
  void initState(BuildContext context) {
    addToCartCountModel = createModel(context, () => AddToCartCountModel());
    fABProdEditForAdminModel =
        createModel(context, () => FABProdEditForAdminModel());
    fABWholeStorePageModel =
        createModel(context, () => FABWholeStorePageModel());
  }

  @override
  void dispose() {
    addToCartCountModel.dispose();
    fABProdEditForAdminModel.dispose();
    fABWholeStorePageModel.dispose();
  }
}
