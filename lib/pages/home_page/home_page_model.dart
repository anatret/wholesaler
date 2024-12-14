import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/often_ordered/often_ordered_widget.dart';
import '/components/pizza_item/pizza_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  ProductType? tap;

  bool isSearchDoing = false;

  ///  State fields for stateful widgets in this page.

  // Models for oftenOrdered dynamic component.
  late FlutterFlowDynamicModels<OftenOrderedModel> oftenOrderedModels;
  // State field(s) for SearchTextField widget.
  FocusNode? searchTextFieldFocusNode;
  TextEditingController? searchTextFieldTextController;
  String? Function(BuildContext, String?)?
      searchTextFieldTextControllerValidator;
  List<PizzaRecord> simpleSearchResults = [];
  // State field(s) for ShowDeletedCheckbox widget.
  bool? showDeletedCheckboxValue;
  // Models for PizzaItem dynamic component.
  late FlutterFlowDynamicModels<PizzaItemModel> pizzaItemModels;

  @override
  void initState(BuildContext context) {
    oftenOrderedModels = FlutterFlowDynamicModels(() => OftenOrderedModel());
    pizzaItemModels = FlutterFlowDynamicModels(() => PizzaItemModel());
  }

  @override
  void dispose() {
    oftenOrderedModels.dispose();
    searchTextFieldFocusNode?.dispose();
    searchTextFieldTextController?.dispose();

    pizzaItemModels.dispose();
  }
}
