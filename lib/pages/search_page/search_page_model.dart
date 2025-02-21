import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/prod_grid_card/prod_grid_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_page_widget.dart' show SearchPageWidget;
import 'package:flutter/material.dart';

class SearchPageModel extends FlutterFlowModel<SearchPageWidget> {
  ///  Local state fields for this page.

  ProductType? tap;

  bool isSearchDoing = false;

  bool allCategorical = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for SearchTextField widget.
  FocusNode? searchTextFieldFocusNode;
  TextEditingController? searchTextFieldTextController;
  String? Function(BuildContext, String?)?
      searchTextFieldTextControllerValidator;
  List<PizzaRecord> simpleSearchResults = [];
  // Models for prodGridCard dynamic component.
  late FlutterFlowDynamicModels<ProdGridCardModel> prodGridCardModels1;
  // Models for prodGridCard dynamic component.
  late FlutterFlowDynamicModels<ProdGridCardModel> prodGridCardModels2;

  @override
  void initState(BuildContext context) {
    prodGridCardModels1 = FlutterFlowDynamicModels(() => ProdGridCardModel());
    prodGridCardModels2 = FlutterFlowDynamicModels(() => ProdGridCardModel());
  }

  @override
  void dispose() {
    searchTextFieldFocusNode?.dispose();
    searchTextFieldTextController?.dispose();

    prodGridCardModels1.dispose();
    prodGridCardModels2.dispose();
  }
}
