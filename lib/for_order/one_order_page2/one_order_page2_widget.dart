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
import 'one_order_page2_model.dart';
export 'one_order_page2_model.dart';

class OneOrderPage2Widget extends StatefulWidget {
  const OneOrderPage2Widget({
    super.key,
    required this.order,
  });

  final DocumentReference? order;

  @override
  State<OneOrderPage2Widget> createState() => _OneOrderPage2WidgetState();
}

class _OneOrderPage2WidgetState extends State<OneOrderPage2Widget> {
  late OneOrderPage2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OneOrderPage2Model());
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

        final oneOrderPage2OrderRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                                    'h5tz6tf9' /* 3 */,
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
            body: ListView(
              padding: const EdgeInsets.fromLTRB(
                0,
                0,
                0,
                20.0,
              ),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: StreamBuilder<List<StoresRecord>>(
                    stream: queryStoresRecord(
                      queryBuilder: (storesRecord) => storesRecord.where(
                        'user',
                        isEqualTo: oneOrderPage2OrderRecord.userOrder,
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
                      List<StoresRecord> listViewStoresRecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final listViewStoresRecord =
                          listViewStoresRecordList.isNotEmpty
                              ? listViewStoresRecordList.first
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
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 4.0, 0.0),
                                child: Icon(
                                  Icons.storefront_sharp,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 18.0,
                                ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  listViewStoresRecord?.storeName,
                                  'Магазин',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await Clipboard.setData(ClipboardData(
                                  text: oneOrderPage2OrderRecord.address));
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 4.0, 0.0),
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 18.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: Text(
                                    '${listViewStoresRecord?.address} ${listViewStoresRecord?.room}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .colorLink,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Icon(
                                  Icons.content_copy_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 16.0,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 4.0, 0.0),
                                child: Icon(
                                  Icons.phone_outlined,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 18.0,
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await launchUrl(Uri(
                                    scheme: 'tel',
                                    path: oneOrderPage2OrderRecord.phone,
                                  ));
                                },
                                child: Text(
                                  valueOrDefault<String>(
                                    oneOrderPage2OrderRecord.phone,
                                    'телефон',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .colorLink,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ].divide(const SizedBox(height: 2.0)),
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
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
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 24.0, 0.0, 16.0),
                        child: Text(
                          () {
                            if (oneOrderPage2OrderRecord.orderStatus ==
                                OrderStatus.newOrder) {
                              return 'Новый';
                            } else if (oneOrderPage2OrderRecord.orderStatus ==
                                OrderStatus.confirmed) {
                              return 'Принят';
                            } else if (oneOrderPage2OrderRecord.orderStatus ==
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
                                  if (oneOrderPage2OrderRecord.orderStatus ==
                                      OrderStatus.newOrder) {
                                    return FlutterFlowTheme.of(context).primary;
                                  } else if (oneOrderPage2OrderRecord
                                          .orderStatus ==
                                      OrderStatus.confirmed) {
                                    return FlutterFlowTheme.of(context).warning;
                                  } else if (oneOrderPage2OrderRecord
                                          .orderStatus ==
                                      OrderStatus.completed) {
                                    return FlutterFlowTheme.of(context).success;
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
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final products = (FFAppState().orderForEdit.isNotEmpty
                              ? FFAppState().orderForEdit
                              : oneOrderPage2OrderRecord.cart)
                          .toList();
                      if (products.isEmpty) {
                        return const Center(
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
                            stream:
                                PizzaRecord.getDocument(productsItem.pizza!),
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
                        }).divide(const SizedBox(height: 16.0)),
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'f3xx2rjt' /* Сумма:  */,
                        ),
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        formatNumber(
                          functions.summPizza(
                              (FFAppState().orderForEdit.isNotEmpty
                                      ? FFAppState().orderForEdit
                                      : oneOrderPage2OrderRecord.cart)
                                  .toList()),
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.automatic,
                          currency: '₩',
                        ),
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Outfit',
                              color: const Color(0xFF3C3C3C),
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ),
                if (valueOrDefault<bool>(
                  (oneOrderPage2OrderRecord.orderStatus ==
                          OrderStatus.newOrder) ||
                      (oneOrderPage2OrderRecord.orderStatus ==
                          OrderStatus.confirmed),
                  false,
                ))
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await oneOrderPage2OrderRecord.reference.update({
                          ...mapToFirestore(
                            {
                              'cart': FieldValue.delete(),
                            },
                          ),
                        });
                        if (FFAppState().orderForEdit.isNotEmpty) {
                          await oneOrderPage2OrderRecord.reference.update({
                            ...mapToFirestore(
                              {
                                'cart': getCartListFirestoreData(
                                  FFAppState().orderForEdit,
                                ),
                              },
                            ),
                          });
                        } else {
                          FFAppState().orderForEdit = oneOrderPage2OrderRecord
                              .cart
                              .toList()
                              .cast<CartStruct>();
                          safeSetState(() {});

                          await oneOrderPage2OrderRecord.reference.update({
                            ...mapToFirestore(
                              {
                                'cart': getCartListFirestoreData(
                                  FFAppState().orderForEdit,
                                ),
                              },
                            ),
                          });
                        }

                        if (oneOrderPage2OrderRecord.orderStatus ==
                            OrderStatus.newOrder) {
                          await oneOrderPage2OrderRecord.reference
                              .update(createOrderRecordData(
                            orderStatus: OrderStatus.confirmed,
                          ));
                        } else if (oneOrderPage2OrderRecord.orderStatus ==
                            OrderStatus.confirmed) {
                          await oneOrderPage2OrderRecord.reference
                              .update(createOrderRecordData(
                            orderStatus: OrderStatus.completed,
                          ));
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Заказ обработан',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: const Duration(milliseconds: 2000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).primary,
                          ),
                        );

                        context.goNamed('ManagerOrderListPage');
                      },
                      text: () {
                        if (oneOrderPage2OrderRecord.orderStatus ==
                            OrderStatus.newOrder) {
                          return 'Принять заказ';
                        } else if (oneOrderPage2OrderRecord.orderStatus ==
                            OrderStatus.confirmed) {
                          return 'Заказ обработан';
                        } else {
                          return 'Отмена';
                        }
                      }(),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                        borderSide: const BorderSide(
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
                      (oneOrderPage2OrderRecord.orderStatus ==
                              OrderStatus.confirmed) ||
                          (oneOrderPage2OrderRecord.orderStatus ==
                              OrderStatus.canceled),
                      false,
                    ))
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              // deletingOrderAction
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: const Text('Отмена статуса'),
                                            content: const Text(
                                                'Вы уверенны что хотите отменить статус заказа? После отмены заказ появиться в Новых заказах'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: const Text('Отмена'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: const Text('Удать'),
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
                                    duration: const Duration(milliseconds: 4000),
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
                                    duration: const Duration(milliseconds: 4000),
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
                            icon: const Icon(
                              Icons.cancel_outlined,
                              size: 22.0,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 48.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).secondaryText,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ),
                    if (valueOrDefault<bool>(
                      (oneOrderPage2OrderRecord.orderStatus ==
                              OrderStatus.newOrder) ||
                          (oneOrderPage2OrderRecord.orderStatus ==
                              OrderStatus.confirmed),
                      false,
                    ))
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (oneOrderPage2OrderRecord.orderStatus !=
                                  OrderStatus.canceled) {
                                // deletingOrderAction
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: const Text('Удаление заказа'),
                                              content: const Text(
                                                  'Вы уверенны что хотите удалить'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: const Text('Отмена'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: const Text('Изменить'),
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
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Зазаз удален',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).error,
                                    ),
                                  );
                                  Navigator.pop(context);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Удаление отмененно',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).error,
                                    ),
                                  );
                                  Navigator.pop(context);
                                }
                              }
                            },
                            text: FFLocalizations.of(context).getText(
                              'qiboo5i9' /* Удалить заказ */,
                            ),
                            icon: const Icon(
                              Icons.delete_forever_outlined,
                              size: 22.0,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 48.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
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
                              borderSide: const BorderSide(
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
        );
      },
    );
  }
}
