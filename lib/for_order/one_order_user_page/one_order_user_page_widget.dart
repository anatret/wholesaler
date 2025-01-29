import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/order_item/order_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'one_order_user_page_model.dart';
export 'one_order_user_page_model.dart';

class OneOrderUserPageWidget extends StatefulWidget {
  const OneOrderUserPageWidget({
    super.key,
    required this.order,
  });

  final DocumentReference? order;

  @override
  State<OneOrderUserPageWidget> createState() => _OneOrderUserPageWidgetState();
}

class _OneOrderUserPageWidgetState extends State<OneOrderUserPageWidget> {
  late OneOrderUserPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OneOrderUserPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<OrderRecord>(
      stream: OrderRecord.getDocument(widget.order!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).info,
            body: Center(
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
          );
        }

        final oneOrderUserPageOrderRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).info,
            floatingActionButton: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 6.0),
              child: FloatingActionButton(
                onPressed: () async {
                  _model.wholestore = await StoresRecord.getDocumentOnce(
                      oneOrderUserPageOrderRecord.wholeStore!);
                  await launchUrl(Uri(
                    scheme: 'tel',
                    path: _model.wholestore!.phone,
                  ));

                  safeSetState(() {});
                },
                backgroundColor: FlutterFlowTheme.of(context).success,
                elevation: 8.0,
                child: Icon(
                  Icons.call_outlined,
                  color: FlutterFlowTheme.of(context).info,
                  size: 24.0,
                ),
              ),
            ),
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(58.0),
              child: AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                title: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: const BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.safePop();
                                  },
                                  child: Container(
                                    width: 48.0,
                                    height: 48.0,
                                    decoration: const BoxDecoration(),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Stack(
                            alignment: const AlignmentDirectional(1.0, -1.0),
                            children: [
                              const Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 2.0, 5.0, 0.0),
                                child: Icon(
                                  Icons.notifications_none,
                                  color: Color(0xFF3C3C3C),
                                  size: 24.0,
                                ),
                              ),
                              Container(
                                width: 16.0,
                                height: 16.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  shape: BoxShape.circle,
                                ),
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    's10yrhop' /* 3 */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 9.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                actions: const [],
                centerTitle: false,
                toolbarHeight: 58.0,
                elevation: 0.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(
                    0,
                    0,
                    0,
                    40.0,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 16.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'l0mvspnw' /* Заказ */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Outfit',
                                  fontSize: 32.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 16.0),
                          child: Text(
                            () {
                              if (oneOrderUserPageOrderRecord.orderStatus ==
                                  OrderStatus.newOrder) {
                                return 'Новый';
                              } else if (oneOrderUserPageOrderRecord
                                      .orderStatus ==
                                  OrderStatus.confirmed) {
                                return 'Принят';
                              } else if (oneOrderUserPageOrderRecord
                                      .orderStatus ==
                                  OrderStatus.completed) {
                                return 'Выполнен';
                              } else {
                                return 'Отмена';
                              }
                            }(),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: () {
                                    if (oneOrderUserPageOrderRecord
                                            .orderStatus ==
                                        OrderStatus.newOrder) {
                                      return FlutterFlowTheme.of(context)
                                          .primary;
                                    } else if (oneOrderUserPageOrderRecord
                                            .orderStatus ==
                                        OrderStatus.confirmed) {
                                      return FlutterFlowTheme.of(context)
                                          .warning;
                                    } else if (oneOrderUserPageOrderRecord
                                            .orderStatus ==
                                        OrderStatus.completed) {
                                      return FlutterFlowTheme.of(context)
                                          .success;
                                    } else {
                                      return FlutterFlowTheme.of(context).error;
                                    }
                                  }(),
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Text(
                        '№  ${oneOrderUserPageOrderRecord.numOrder.toString()} от ${dateTimeFormat(
                          "yMMMd",
                          oneOrderUserPageOrderRecord.createDate,
                          locale: FFLocalizations.of(context).languageCode,
                        )}',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        final pizzas =
                            oneOrderUserPageOrderRecord.cart.toList();

                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(pizzas.length, (pizzasIndex) {
                            final pizzasItem = pizzas[pizzasIndex];
                            return StreamBuilder<PizzaRecord>(
                              stream:
                                  PizzaRecord.getDocument(pizzasItem.pizza!),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }

                                final containerPizzaRecord = snapshot.data!;

                                return Container(
                                  decoration: const BoxDecoration(),
                                  child: wrapWithModel(
                                    model: _model.orderItemModels.getModel(
                                      pizzasIndex.toString(),
                                      pizzasIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: OrderItemWidget(
                                      key: Key(
                                        'Keymor_${pizzasIndex.toString()}',
                                      ),
                                      name: containerPizzaRecord.name,
                                      deskription:
                                          containerPizzaRecord.description,
                                      price: pizzasItem.price,
                                      image: containerPizzaRecord.img,
                                      pizzaValue: pizzasItem.count,
                                    ),
                                  ),
                                );
                              },
                            );
                          }),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          16.0, 20.0, 16.0, 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'penlq8th' /* Сумма:  */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            formatNumber(
                              functions.summPizza(
                                  oneOrderUserPageOrderRecord.cart.toList()),
                              formatType: FormatType.decimal,
                              decimalType: DecimalType.automatic,
                              currency: '₩ ',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: StreamBuilder<StoresRecord>(
                        stream: StoresRecord.getDocument(
                            oneOrderUserPageOrderRecord.wholeStore!),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }

                          final orderDetailsContainerStoresRecord =
                              snapshot.data!;

                          return Container(
                            width: double.infinity,
                            constraints: const BoxConstraints(
                              minWidth: double.infinity,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                Text(
                                  orderDetailsContainerStoresRecord.storeName,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Divider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 4.0),
                                      child: Text(
                                        '${oneOrderUserPageOrderRecord.address} ${oneOrderUserPageOrderRecord.home} ${oneOrderUserPageOrderRecord.room}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      oneOrderUserPageOrderRecord.comment,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ].divide(const SizedBox(height: 6.0)),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
