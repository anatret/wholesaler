import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/my_client_item/my_client_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'my_clients_widget.dart' show MyClientsWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MyClientsModel extends FlutterFlowModel<MyClientsWidget> {
  ///  Local state fields for this page.

  UserTypes? userTypeSearch = UserTypes.user;

  ///  State fields for stateful widgets in this page.

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, UserRecord>? listViewPagingController;
  Query? listViewPagingQuery;

  // Models for MyClientItem dynamic component.
  late FlutterFlowDynamicModels<MyClientItemModel> myClientItemModels;

  @override
  void initState(BuildContext context) {
    myClientItemModels = FlutterFlowDynamicModels(() => MyClientItemModel());
  }

  @override
  void dispose() {
    listViewPagingController?.dispose();

    myClientItemModels.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
  PagingController<DocumentSnapshot?, UserRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, UserRecord> _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, UserRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryUserRecordPage(
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          controller: controller,
          pageSize: 10,
          isStream: false,
        ),
      );
  }
}
