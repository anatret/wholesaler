import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/often_ordered/often_ordered_widget.dart';
import '/components/whole_store_item/whole_store_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_whole_store_widget.dart' show HomePageWholeStoreWidget;
import 'package:flutter/material.dart';

class HomePageWholeStoreModel
    extends FlutterFlowModel<HomePageWholeStoreWidget> {
  ///  Local state fields for this page.

  ProductType? tap;

  bool isSearchDoing = false;

  bool allCategorical = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in HomePageWholeStore widget.
  StoresRecord? usersStore;
  // State field(s) for SearchTextField widget.
  FocusNode? searchTextFieldFocusNode;
  TextEditingController? searchTextFieldTextController;
  String? Function(BuildContext, String?)?
      searchTextFieldTextControllerValidator;
  List<PizzaRecord> simpleSearchResults = [];
  // Models for oftenOrdered dynamic component.
  late FlutterFlowDynamicModels<OftenOrderedModel> oftenOrderedModels;
  // State field(s) for ShowDeletedCheckbox widget.
  bool? showDeletedCheckboxValue;
  // Models for wholeStoreItem dynamic component.
  late FlutterFlowDynamicModels<WholeStoreItemModel> wholeStoreItemModels;

  @override
  void initState(BuildContext context) {
    oftenOrderedModels = FlutterFlowDynamicModels(() => OftenOrderedModel());
    wholeStoreItemModels =
        FlutterFlowDynamicModels(() => WholeStoreItemModel());
  }

  @override
  void dispose() {
    searchTextFieldFocusNode?.dispose();
    searchTextFieldTextController?.dispose();

    oftenOrderedModels.dispose();
    wholeStoreItemModels.dispose();
  }
}
