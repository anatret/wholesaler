import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'prod_grid_card_model.dart';
export 'prod_grid_card_model.dart';

class ProdGridCardWidget extends StatefulWidget {
  const ProdGridCardWidget({
    super.key,
    required this.productRef,
  });

  final DocumentReference? productRef;

  @override
  State<ProdGridCardWidget> createState() => _ProdGridCardWidgetState();
}

class _ProdGridCardWidgetState extends State<ProdGridCardWidget>
    with TickerProviderStateMixin {
  late ProdGridCardModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProdGridCardModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 70.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
      child: StreamBuilder<PizzaRecord>(
        stream: PizzaRecord.getDocument(widget.productRef!),
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
            width: double.infinity,
            height: 200.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x2B202529),
                  offset: Offset(
                    0.0,
                    2.0,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: StreamBuilder<StoresRecord>(
              stream: StoresRecord.getDocument(containerPizzaRecord.store!),
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

                final stackStoresRecord = snapshot.data!;

                return Stack(
                  children: [
                    Opacity(
                      opacity: containerPizzaRecord.inStock ? 1.0 : 0.25,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 120.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                containerPizzaRecord.img,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 8.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  containerPizzaRecord.name.maybeHandleOverflow(
                                    maxChars: 40,
                                    replacement: '…',
                                  ),
                                  maxLines: 3,
                                  minFontSize: 10.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 10.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                                Text(
                                  formatNumber(
                                    containerPizzaRecord.price,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.automatic,
                                    currency: '₩ ',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ].divide(const SizedBox(height: 8.0)),
                      ),
                    ),
                    if (currentUserDocument?.userType != UserTypes.manager)
                      Opacity(
                        opacity: containerPizzaRecord.inStock ? 1.0 : 0.25,
                        child: Align(
                          alignment: const AlignmentDirectional(1.0, 1.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Builder(
                                  builder: (context) {
                                    if (functions.checkCart(
                                        FFAppState()
                                            .cart
                                            .map((e) => e.pizza)
                                            .withoutNulls
                                            .toList(),
                                        widget.productRef!)) {
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 4.0, 4.0),
                                        child: Container(
                                          decoration: const BoxDecoration(),
                                          child: Visibility(
                                            visible:
                                                !stackStoresRecord.itsCoupang,
                                            child: Icon(
                                              Icons.check,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                              size: 18.0,
                                            ),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation2']!),
                                      );
                                    } else {
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (containerPizzaRecord.inStock) {
                                            if (!functions.checkCart(
                                                FFAppState()
                                                    .cart
                                                    .map((e) => e.pizza)
                                                    .withoutNulls
                                                    .toList(),
                                                widget.productRef!)) {
                                              if (FFAppState()
                                                      .wholeSalerinCart ==
                                                  null) {
                                                FFAppState()
                                                    .addToCart(CartStruct(
                                                  pizza: containerPizzaRecord
                                                      .reference,
                                                  price: containerPizzaRecord
                                                      .price,
                                                  count: 1,
                                                ));
                                                FFAppState().wholeSalerinCart =
                                                    stackStoresRecord.reference;
                                                _model.updatePage(() {});
                                              } else if ((FFAppState()
                                                          .wholeSalerinCart !=
                                                      null) &&
                                                  (FFAppState()
                                                          .wholeSalerinCart ==
                                                      stackStoresRecord
                                                          .reference)) {
                                                FFAppState()
                                                    .addToCart(CartStruct(
                                                  pizza: widget.productRef,
                                                  price: containerPizzaRecord
                                                      .price,
                                                  count: 1,
                                                ));
                                                _model.updatePage(() {});
                                              } else {
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                                  ruText:
                                                                      'Ошибка добавления',
                                                                  enText:
                                                                      'Error adding',
                                                                  koText:
                                                                      '추가 중 오류 발생',
                                                                  zh_HansText:
                                                                      '',
                                                                ),
                                                                '添加错误',
                                                              )),
                                                              content: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                ruText:
                                                                    'В корзине уже находятся товары от другого поставщика. Пожалуйста, завершите оформление текущего заказа или очистите корзину, чтобы добавить новый товар.',
                                                                enText:
                                                                    'There are already items in your cart from another supplier. Please complete your current order or clear your cart to add a new item.',
                                                                koText:
                                                                    '장바구니에 이미 다른 공급업체의 상품이 포함되어 있습니다. 현재 주문을 완료하거나 장바구니를 비워 새 품목을 추가하세요.',
                                                                zh_HansText:
                                                                    '您的购物车已包含来自其他供应商的商品。请完成当前订单或清空购物车以添加新商品。',
                                                              )),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: const Text(
                                                                      'Отмена'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: const Text(
                                                                      'Очистить и добавить '),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  FFAppState().cart = [];
                                                  FFAppState()
                                                      .wholeSalerinCart = null;
                                                  _model.updatePage(() {});
                                                  FFAppState()
                                                      .addToCart(CartStruct(
                                                    pizza: containerPizzaRecord
                                                        .reference,
                                                    price: containerPizzaRecord
                                                        .price,
                                                    count: 1,
                                                  ));
                                                  FFAppState()
                                                          .wholeSalerinCart =
                                                      stackStoresRecord
                                                          .reference;
                                                  _model.updatePage(() {});
                                                } else {
                                                  return;
                                                }
                                              }

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    FFLocalizations.of(context)
                                                        .getVariableText(
                                                      ruText:
                                                          'Товар добавлен в корзину',
                                                      enText: 'Product added',
                                                      koText: '제품이 추가되었습니다',
                                                      zh_HansText: '产品已添加',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 1500),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                ),
                                              );
                                            }
                                          }
                                        },
                                        child: AnimatedContainer(
                                          duration: const Duration(milliseconds: 600),
                                          curve: Curves.bounceOut,
                                          decoration: const BoxDecoration(),
                                          child: Visibility(
                                            visible:
                                                !stackStoresRecord.itsCoupang,
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(6.0, 6.0, 6.0, 6.0),
                                              child: Icon(
                                                Icons.add_shopping_cart,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 18.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    if (!containerPizzaRecord.inStock)
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '61mxcz00' /* Будет позже */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!);
        },
      ),
    );
  }
}
