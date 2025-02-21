import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/cart_item2/cart_item2_widget.dart';
import '/components/empty_cart/empty_cart_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'one_order_manager_page_model.dart';
export 'one_order_manager_page_model.dart';

class OneOrderManagerPageWidget extends StatefulWidget {
  const OneOrderManagerPageWidget({
    super.key,
    required this.order,
  });

  final DocumentReference? order;

  @override
  State<OneOrderManagerPageWidget> createState() =>
      _OneOrderManagerPageWidgetState();
}

class _OneOrderManagerPageWidgetState extends State<OneOrderManagerPageWidget> {
  late OneOrderManagerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OneOrderManagerPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<OrderRecord>(
      stream: OrderRecord.getDocument(widget.order!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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

        final oneOrderManagerPageOrderRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(58.0),
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
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
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
            body: Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 450.0,
                ),
                decoration: BoxDecoration(),
                child: ListView(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    0,
                    0,
                    20.0,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: StreamBuilder<List<StoresRecord>>(
                        stream: queryStoresRecord(
                          queryBuilder: (storesRecord) => storesRecord.where(
                            'user',
                            isEqualTo: oneOrderManagerPageOrderRecord.userOrder,
                          ),
                          singleRecord: true,
                        ),
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
                          List<StoresRecord>
                              listViewClientStoreStoresRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final listViewClientStoreStoresRecord =
                              listViewClientStoreStoresRecordList.isNotEmpty
                                  ? listViewClientStoreStoresRecordList.first
                                  : null;

                          return ListView(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 4.0, 0.0),
                                    child: Icon(
                                      Icons.storefront_sharp,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 18.0,
                                    ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      listViewClientStoreStoresRecord
                                          ?.storeName,
                                      'Магазин',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 4.0, 0.0),
                                      child: Icon(
                                        Icons.location_on_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 18.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await Clipboard.setData(ClipboardData(
                                              text:
                                                  '${oneOrderManagerPageOrderRecord.address} ${oneOrderManagerPageOrderRecord.room}'));
                                        },
                                        child: Text(
                                          '${oneOrderManagerPageOrderRecord.address} ${oneOrderManagerPageOrderRecord.room}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .colorLink,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 4.0, 0.0),
                                      child: Icon(
                                        Icons.phone_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 18.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (isWeb) {
                                            await Clipboard.setData(ClipboardData(
                                                text:
                                                    oneOrderManagerPageOrderRecord
                                                        .phone));
                                          } else {
                                            await launchUrl(Uri(
                                              scheme: 'tel',
                                              path:
                                                  oneOrderManagerPageOrderRecord
                                                      .phone,
                                            ));
                                          }
                                        },
                                        child: Text(
                                          valueOrDefault<String>(
                                            oneOrderManagerPageOrderRecord
                                                .phone,
                                            'телефон',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .colorLink,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ].divide(SizedBox(height: 6.0)),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 16.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '1w9buw09' /* Заказ */,
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 16.0),
                            child: Text(
                              () {
                                if (oneOrderManagerPageOrderRecord
                                        .orderStatus ==
                                    OrderStatus.newOrder) {
                                  return 'Новый';
                                } else if (oneOrderManagerPageOrderRecord
                                        .orderStatus ==
                                    OrderStatus.confirmed) {
                                  return 'Принят';
                                } else if (oneOrderManagerPageOrderRecord
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
                                      if (oneOrderManagerPageOrderRecord
                                              .orderStatus ==
                                          OrderStatus.newOrder) {
                                        return FlutterFlowTheme.of(context)
                                            .primary;
                                      } else if (oneOrderManagerPageOrderRecord
                                              .orderStatus ==
                                          OrderStatus.confirmed) {
                                        return FlutterFlowTheme.of(context)
                                            .warning;
                                      } else if (oneOrderManagerPageOrderRecord
                                              .orderStatus ==
                                          OrderStatus.completed) {
                                        return FlutterFlowTheme.of(context)
                                            .success;
                                      } else {
                                        return FlutterFlowTheme.of(context)
                                            .error;
                                      }
                                    }(),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final products = (FFAppState().orderForEdit.isNotEmpty
                                  ? FFAppState().orderForEdit
                                  : oneOrderManagerPageOrderRecord.cart)
                              .toList();
                          if (products.isEmpty) {
                            return Center(
                              child: EmptyCartWidget(
                                page: 'cart',
                              ),
                            );
                          }

                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:
                                List.generate(products.length, (productsIndex) {
                              final productsItem = products[productsIndex];
                              return StreamBuilder<PizzaRecord>(
                                stream: PizzaRecord.getDocument(
                                    productsItem.pizza!),
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
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }

                                  final containerPizzaRecord = snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: wrapWithModel(
                                      model: _model.cartItem2Models.getModel(
                                        productsIndex.toString(),
                                        productsIndex,
                                      ),
                                      updateCallback: () => safeSetState(() {}),
                                      child: CartItem2Widget(
                                        key: Key(
                                          'Keyjhl_${productsIndex.toString()}',
                                        ),
                                        name: containerPizzaRecord.name,
                                        deskription:
                                            containerPizzaRecord.description,
                                        price: containerPizzaRecord.price,
                                        image: containerPizzaRecord.img,
                                        index: productsIndex,
                                        cartItem: productsItem,
                                      ),
                                    ),
                                  );
                                },
                              );
                            }).divide(SizedBox(height: 16.0)),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'f3xx2rjt' /* Сумма:  */,
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
                                  (FFAppState().orderForEdit.isNotEmpty
                                          ? FFAppState().orderForEdit
                                          : oneOrderManagerPageOrderRecord.cart)
                                      .toList()),
                              formatType: FormatType.decimal,
                              decimalType: DecimalType.automatic,
                              currency: '₩',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFF3C3C3C),
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                    if (valueOrDefault<bool>(
                      (oneOrderManagerPageOrderRecord.orderStatus ==
                              OrderStatus.newOrder) ||
                          (oneOrderManagerPageOrderRecord.orderStatus ==
                              OrderStatus.confirmed),
                      false,
                    ))
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await oneOrderManagerPageOrderRecord.reference
                                .update({
                              ...mapToFirestore(
                                {
                                  'cart': FieldValue.delete(),
                                },
                              ),
                            });
                            if (FFAppState().orderForEdit.isNotEmpty) {
                              await oneOrderManagerPageOrderRecord.reference
                                  .update({
                                ...mapToFirestore(
                                  {
                                    'cart': getCartListFirestoreData(
                                      FFAppState().orderForEdit,
                                    ),
                                  },
                                ),
                              });
                            } else {
                              FFAppState().orderForEdit =
                                  oneOrderManagerPageOrderRecord.cart
                                      .toList()
                                      .cast<CartStruct>();
                              safeSetState(() {});

                              await oneOrderManagerPageOrderRecord.reference
                                  .update({
                                ...mapToFirestore(
                                  {
                                    'cart': getCartListFirestoreData(
                                      FFAppState().orderForEdit,
                                    ),
                                  },
                                ),
                              });
                            }

                            if (oneOrderManagerPageOrderRecord.orderStatus ==
                                OrderStatus.newOrder) {
                              await oneOrderManagerPageOrderRecord.reference
                                  .update(createOrderRecordData(
                                orderStatus: OrderStatus.confirmed,
                              ));
                            } else if (oneOrderManagerPageOrderRecord
                                    .orderStatus ==
                                OrderStatus.confirmed) {
                              await oneOrderManagerPageOrderRecord.reference
                                  .update(createOrderRecordData(
                                orderStatus: OrderStatus.completed,
                              ));
                            }

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Заказ обработан',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                ),
                                duration: Duration(milliseconds: 2000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).primary,
                              ),
                            );

                            context.goNamed(
                              'UserOrderListPage',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.scale,
                                  alignment: Alignment.bottomCenter,
                                ),
                              },
                            );
                          },
                          text: () {
                            if (oneOrderManagerPageOrderRecord.orderStatus ==
                                OrderStatus.newOrder) {
                              return 'Принять заказ';
                            } else if (oneOrderManagerPageOrderRecord
                                    .orderStatus ==
                                OrderStatus.confirmed) {
                              return 'Заказ обработан';
                            } else {
                              return 'Отмена';
                            }
                          }(),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 48.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (valueOrDefault<bool>(
                          (oneOrderManagerPageOrderRecord.orderStatus ==
                                  OrderStatus.confirmed) ||
                              (oneOrderManagerPageOrderRecord.orderStatus ==
                                  OrderStatus.canceled),
                          false,
                        ))
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  // deletingOrderAction
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Отмена статуса'),
                                                content: Text(
                                                    'Вы уверенны что хотите отменить статус заказа? После отмены заказ появиться в Новых заказах'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            false),
                                                    child: Text('Отмена'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            true),
                                                    child: Text('Удать'),
                                                  ),
                                                ],
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    await widget.order!
                                        .update(createOrderRecordData(
                                      orderStatus: OrderStatus.newOrder,
                                    ));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Статус заказа отменен!',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                    Navigator.pop(context);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Отмененно',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                    Navigator.pop(context);
                                  }
                                },
                                text: FFLocalizations.of(context).getText(
                                  '6xlo3m9v' /* Отмена статуса */,
                                ),
                                icon: Icon(
                                  Icons.cancel_outlined,
                                  size: 22.0,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 48.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                          ),
                        if (valueOrDefault<bool>(
                          (oneOrderManagerPageOrderRecord.orderStatus ==
                                  OrderStatus.newOrder) ||
                              (oneOrderManagerPageOrderRecord.orderStatus ==
                                  OrderStatus.confirmed),
                          false,
                        ))
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (oneOrderManagerPageOrderRecord
                                          .orderStatus !=
                                      OrderStatus.canceled) {
                                    // deletingOrderAction
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title:
                                                      Text('Удаление заказа'),
                                                  content: Text(
                                                      'Вы уверенны что хотите удалить'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('Отмена'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('Изменить'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ) ??
                                            false;
                                    if (confirmDialogResponse) {
                                      await widget.order!
                                          .update(createOrderRecordData(
                                        orderStatus: OrderStatus.canceled,
                                      ));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Зазаз удален',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                        ),
                                      );
                                      Navigator.pop(context);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Удаление отмененно',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                        ),
                                      );
                                      Navigator.pop(context);
                                    }
                                  }
                                },
                                text: FFLocalizations.of(context).getText(
                                  'qiboo5i9' /* Удалить заказ */,
                                ),
                                icon: Icon(
                                  Icons.delete_forever_outlined,
                                  size: 22.0,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 48.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).error,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                          ),
                      ],
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
