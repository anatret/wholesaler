import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'item_order_user_model.dart';
export 'item_order_user_model.dart';

class ItemOrderUserWidget extends StatefulWidget {
  const ItemOrderUserWidget({
    super.key,
    required this.orderRef,
  });

  final DocumentReference? orderRef;

  @override
  State<ItemOrderUserWidget> createState() => _ItemOrderUserWidgetState();
}

class _ItemOrderUserWidgetState extends State<ItemOrderUserWidget>
    with TickerProviderStateMixin {
  late ItemOrderUserModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemOrderUserModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
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
            begin: Offset(0.0, 70.0),
            end: Offset(0.0, 0.0),
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
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
      child: StreamBuilder<OrderRecord>(
        stream: OrderRecord.getDocument(widget.orderRef!),
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

          final containerOrderRecord = snapshot.data!;

          return Container(
            width: double.infinity,
            height: 110.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
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
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StreamBuilder<StoresRecord>(
                        stream: StoresRecord.getDocument(
                            containerOrderRecord.wholeStore!),
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

                          final rowStoresRecord = snapshot.data!;

                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.network(
                                      rowStoresRecord.logoImg,
                                    ).image,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Builder(
                                  builder: (context) {
                                    if (rowStoresRecord.logoImg != '') {
                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          rowStoresRecord.logoImg,
                                          width: 50.0,
                                          height: 50.0,
                                          fit: BoxFit.contain,
                                        ),
                                      );
                                    } else {
                                      return Icon(
                                        Icons.no_photography,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      );
                                    }
                                  },
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    rowStoresRecord.storeName,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Outfit',
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    '${valueOrDefault<String>(
                                      FFLocalizations.of(context)
                                          .getVariableText(
                                        ruText: 'Заказ №',
                                        enText: 'Order No.',
                                        koText: '주문번호',
                                        zh_HansText: '订单号',
                                      ),
                                      'Заказ №',
                                    )}${containerOrderRecord.numOrder.toString()}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          );
                        },
                      ),
                    ].divide(SizedBox(width: 12.0)),
                  ),
                  Container(
                    height: 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '4fr08629' /* Дата заказа */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                          ),
                          Text(
                            dateTimeFormat(
                              "yMMMd",
                              containerOrderRecord.createDate!,
                              locale: FFLocalizations.of(context).languageCode,
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
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'ziinv5nu' /* Сумма заказа */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                          ),
                          Text(
                            formatNumber(
                              functions.summPizza(
                                  containerOrderRecord.cart.toList()),
                              formatType: FormatType.decimal,
                              decimalType: DecimalType.automatic,
                              currency: '₩ ',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ].divide(SizedBox(height: 8.0)),
              ),
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
        },
      ),
    );
  }
}
