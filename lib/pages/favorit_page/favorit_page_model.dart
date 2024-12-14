import '/components/favorit_item/favorit_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'favorit_page_widget.dart' show FavoritPageWidget;
import 'package:flutter/material.dart';

class FavoritPageModel extends FlutterFlowModel<FavoritPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for FavoritItem dynamic component.
  late FlutterFlowDynamicModels<FavoritItemModel> favoritItemModels;

  @override
  void initState(BuildContext context) {
    favoritItemModels = FlutterFlowDynamicModels(() => FavoritItemModel());
  }

  @override
  void dispose() {
    favoritItemModels.dispose();
  }
}
