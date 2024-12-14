import '/components/address_item/address_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'addresses_widget.dart' show AddressesWidget;
import 'package:flutter/material.dart';

class AddressesModel extends FlutterFlowModel<AddressesWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for addressItem dynamic component.
  late FlutterFlowDynamicModels<AddressItemModel> addressItemModels;

  @override
  void initState(BuildContext context) {
    addressItemModels = FlutterFlowDynamicModels(() => AddressItemModel());
  }

  @override
  void dispose() {
    addressItemModels.dispose();
  }
}
