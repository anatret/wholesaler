import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/item_order_manager/item_order_manager_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_order_list_page_widget.dart' show AdminOrderListPageWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AdminOrderListPageModel
    extends FlutterFlowModel<AdminOrderListPageWidget> {
  ///  Local state fields for this page.

  OrderStatus? orderStatus = OrderStatus.newOrder;

  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, OrderRecord>? listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  // Models for itemOrderManager dynamic component.
  late FlutterFlowDynamicModels<ItemOrderManagerModel> itemOrderManagerModels;

  @override
  void initState(BuildContext context) {
    itemOrderManagerModels =
        FlutterFlowDynamicModels(() => ItemOrderManagerModel());
  }

  @override
  void dispose() {
    for (var s in listViewStreamSubscriptions) {
      s?.cancel();
    }
    listViewPagingController?.dispose();

    itemOrderManagerModels.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, OrderRecord> setListViewController(
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

  PagingController<DocumentSnapshot?, OrderRecord> _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, OrderRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryOrderRecordPage(
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
