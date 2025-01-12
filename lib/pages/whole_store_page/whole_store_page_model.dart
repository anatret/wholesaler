import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/often_ordered/often_ordered_widget.dart';
import '/components/prod_grid_card/prod_grid_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'whole_store_page_widget.dart' show WholeStorePageWidget;
import 'package:flutter/material.dart';

class WholeStorePageModel extends FlutterFlowModel<WholeStorePageWidget> {
  ///  Local state fields for this page.

  ProductType? tap;

  bool isSearchDoing = false;

  bool allCategorical = false;

  ///  State fields for stateful widgets in this page.

  List<PizzaRecord> simpleSearchResults1 = [];
  // Models for oftenOrdered dynamic component.
  late FlutterFlowDynamicModels<OftenOrderedModel> oftenOrderedModels;
  // State field(s) for SearchTextField widget.
  FocusNode? searchTextFieldFocusNode;
  TextEditingController? searchTextFieldTextController;
  String? Function(BuildContext, String?)?
      searchTextFieldTextControllerValidator;
  List<PizzaRecord> simpleSearchResults2 = [];
  // State field(s) for ShowDeletedCheckbox widget.
  bool? showDeletedCheckboxValue;
  // Models for prodGridCard dynamic component.
  late FlutterFlowDynamicModels<ProdGridCardModel> prodGridCardModels;

  @override
  void initState(BuildContext context) {
    oftenOrderedModels = FlutterFlowDynamicModels(() => OftenOrderedModel());
    prodGridCardModels = FlutterFlowDynamicModels(() => ProdGridCardModel());
  }

  @override
  void dispose() {
    oftenOrderedModels.dispose();
    searchTextFieldFocusNode?.dispose();
    searchTextFieldTextController?.dispose();

    prodGridCardModels.dispose();
  }
}
