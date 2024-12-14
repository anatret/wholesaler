import '/components/my_client_item/my_client_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'my_clients_widget.dart' show MyClientsWidget;
import 'package:flutter/material.dart';

class MyClientsModel extends FlutterFlowModel<MyClientsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Models for MyClientItem dynamic component.
  late FlutterFlowDynamicModels<MyClientItemModel> myClientItemModels;

  @override
  void initState(BuildContext context) {
    myClientItemModels = FlutterFlowDynamicModels(() => MyClientItemModel());
  }

  @override
  void dispose() {
    myClientItemModels.dispose();
  }
}
