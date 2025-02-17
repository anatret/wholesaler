import '/components/prod_grid_card/prod_grid_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_promotion2_widget.dart' show AddPromotion2Widget;
import 'package:flutter/material.dart';

class AddPromotion2Model extends FlutterFlowModel<AddPromotion2Widget> {
  ///  State fields for stateful widgets in this page.

  // Models for prodGridCard dynamic component.
  late FlutterFlowDynamicModels<ProdGridCardModel> prodGridCardModels;

  @override
  void initState(BuildContext context) {
    prodGridCardModels = FlutterFlowDynamicModels(() => ProdGridCardModel());
  }

  @override
  void dispose() {
    prodGridCardModels.dispose();
  }
}
