import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/item_order_manager/item_order_manager_widget.dart';
import '/components/item_order_user/item_order_user_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_order_list_page_widget.dart' show UserOrderListPageWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class UserOrderListPageModel extends FlutterFlowModel<UserOrderListPageWidget> {
  ///  Local state fields for this page.

  OrderStatus? orderStatus = OrderStatus.newOrder;

  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, OrderRecord>? listViewPagingController1;
  Query? listViewPagingQuery1;
  List<StreamSubscription?> listViewStreamSubscriptions1 = [];

  // Models for itemOrderUser dynamic component.
  late FlutterFlowDynamicModels<ItemOrderUserModel> itemOrderUserModels;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, OrderRecord>? listViewPagingController3;
  Query? listViewPagingQuery3;
  List<StreamSubscription?> listViewStreamSubscriptions3 = [];

  // Models for itemOrderManager dynamic component.
  late FlutterFlowDynamicModels<ItemOrderManagerModel> itemOrderManagerModels;

  @override
  void initState(BuildContext context) {
    itemOrderUserModels = FlutterFlowDynamicModels(() => ItemOrderUserModel());
    itemOrderManagerModels =
        FlutterFlowDynamicModels(() => ItemOrderManagerModel());
  }

  @override
  void dispose() {
    for (var s in listViewStreamSubscriptions1) {
      s?.cancel();
    }
    listViewPagingController1?.dispose();

    itemOrderUserModels.dispose();
    for (var s in listViewStreamSubscriptions3) {
      s?.cancel();
    }
    listViewPagingController3?.dispose();

    itemOrderManagerModels.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, OrderRecord> setListViewController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController1 ??= _createListViewController1(query, parent);
    if (listViewPagingQuery1 != query) {
      listViewPagingQuery1 = query;
      listViewPagingController1?.refresh();
    }
    return listViewPagingController1!;
  }

  PagingController<DocumentSnapshot?, OrderRecord> _createListViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, OrderRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryOrderRecordPage(
          queryBuilder: (_) => listViewPagingQuery1 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions1,
          controller: controller,
          pageSize: 5,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, OrderRecord> setListViewController3(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController3 ??= _createListViewController3(query, parent);
    if (listViewPagingQuery3 != query) {
      listViewPagingQuery3 = query;
      listViewPagingController3?.refresh();
    }
    return listViewPagingController3!;
  }

  PagingController<DocumentSnapshot?, OrderRecord> _createListViewController3(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, OrderRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryOrderRecordPage(
          queryBuilder: (_) => listViewPagingQuery3 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions3,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
