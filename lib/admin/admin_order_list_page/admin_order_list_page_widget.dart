import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/empty_cart/empty_cart_widget.dart';
import '/components/item_order_manager/item_order_manager_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'admin_order_list_page_model.dart';
export 'admin_order_list_page_model.dart';

class AdminOrderListPageWidget extends StatefulWidget {
  const AdminOrderListPageWidget({super.key});

  @override
  State<AdminOrderListPageWidget> createState() =>
      _AdminOrderListPageWidgetState();
}

class _AdminOrderListPageWidgetState extends State<AdminOrderListPageWidget> {
  late AdminOrderListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminOrderListPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).info,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(58.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            title: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 5.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.safePop();
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            actions: [],
            centerTitle: false,
            toolbarHeight: 58.0,
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 450.0,
              ),
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.orderStatus = OrderStatus.newOrder;
                              safeSetState(() {});
                            },
                            child: Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    offset: Offset(
                                      0.0,
                                      2.0,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 4.0, 0.0),
                                    child: Icon(
                                      Icons.new_releases,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'tb55yeod' /* Новые */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.orderStatus = OrderStatus.confirmed;
                              safeSetState(() {});
                            },
                            child: Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    offset: Offset(
                                      0.0,
                                      2.0,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 4.0, 0.0),
                                    child: Icon(
                                      Icons.checklist_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'r4nvk3m5' /* Принятые */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.orderStatus = OrderStatus.completed;
                              safeSetState(() {});
                            },
                            child: Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    offset: Offset(
                                      0.0,
                                      2.0,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    6.0, 6.0, 10.0, 6.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 4.0, 0.0),
                                      child: Icon(
                                        Icons.download_done_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .success,
                                        size: 24.0,
                                      ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'k0nq4e6j' /* Готовые */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.orderStatus = OrderStatus.canceled;
                              safeSetState(() {});
                            },
                            child: Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    offset: Offset(
                                      0.0,
                                      2.0,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    6.0, 6.0, 10.0, 6.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 4.0, 0.0),
                                      child: Icon(
                                        Icons.cancel_outlined,
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        size: 24.0,
                                      ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '0it2emjm' /* Отмена */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 4.0)),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 16.0),
                      child: Text(
                        () {
                          if (_model.orderStatus == OrderStatus.newOrder) {
                            return 'Новые заказы';
                          } else if (_model.orderStatus ==
                              OrderStatus.confirmed) {
                            return 'Принятые заказы';
                          } else if (_model.orderStatus ==
                              OrderStatus.completed) {
                            return 'Готовые заказы';
                          } else {
                            return 'Отмененые заказы';
                          }
                        }(),
                        style: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .override(
                              fontFamily: 'Outfit',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 32.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    PagedListView<DocumentSnapshot<Object?>?, OrderRecord>(
                      pagingController: _model.setListViewController(
                        OrderRecord.collection
                            .where(
                              'orderStatus',
                              isEqualTo: _model.orderStatus?.serialize(),
                            )
                            .orderBy('createDate', descending: true),
                      ),
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      reverse: false,
                      scrollDirection: Axis.vertical,
                      builderDelegate: PagedChildBuilderDelegate<OrderRecord>(
                        // Customize what your widget looks like when it's loading the first page.
                        firstPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        ),
                        // Customize what your widget looks like when it's loading another page.
                        newPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        ),
                        noItemsFoundIndicatorBuilder: (_) => Center(
                          child: EmptyCartWidget(
                            page: 'newOrder',
                          ),
                        ),
                        itemBuilder: (context, _, listViewIndex) {
                          final listViewOrderRecord = _model
                              .listViewPagingController!
                              .itemList![listViewIndex];
                          return wrapWithModel(
                            model: _model.itemOrderManagerModels.getModel(
                              listViewIndex.toString(),
                              listViewIndex,
                            ),
                            updateCallback: () => safeSetState(() {}),
                            child: ItemOrderManagerWidget(
                              key: Key(
                                'Keyekz_${listViewIndex.toString()}',
                              ),
                              orderRef: listViewOrderRecord.reference,
                            ),
                          );
                        },
                      ),
                    ),
                  ].addToEnd(SizedBox(height: 30.0)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
