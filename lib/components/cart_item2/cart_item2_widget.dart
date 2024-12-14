import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'cart_item2_model.dart';
export 'cart_item2_model.dart';

class CartItem2Widget extends StatefulWidget {
  const CartItem2Widget({
    super.key,
    required this.name,
    required this.deskription,
    required this.price,
    required this.image,
    required this.cartItem,
    required this.index,
  });

  final String? name;
  final String? deskription;
  final int? price;
  final String? image;
  final CartStruct? cartItem;
  final int? index;

  @override
  State<CartItem2Widget> createState() => _CartItem2WidgetState();
}

class _CartItem2WidgetState extends State<CartItem2Widget> {
  late CartItem2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartItem2Model());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.value = widget.cartItem!.count;
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 160.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      widget.image!,
                      width: 110.0,
                      height: 110.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.name,
                            'Название продукта',
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.deskription,
                            'Описание продукта',
                          ).maybeHandleOverflow(
                            maxChars: 30,
                            replacement: '…',
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: const Color(0xFF5B5B5B),
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 8.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFF0E6),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (_model.value != 1) {
                                        if (FFAppState()
                                            .orderForEdit
                                            .isNotEmpty) {
                                          _model.value = _model.value + -1;
                                          safeSetState(() {});
                                          FFAppState()
                                              .updateOrderForEditAtIndex(
                                            widget.index!,
                                            (e) => e..count = _model.value,
                                          );
                                          FFAppState().update(() {});
                                        } else {
                                          FFAppState().orderForEdit = _model
                                              .order
                                              .toList()
                                              .cast<CartStruct>();
                                          safeSetState(() {});
                                          _model.value = _model.value + -1;
                                          safeSetState(() {});
                                          FFAppState()
                                              .updateOrderForEditAtIndex(
                                            widget.index!,
                                            (e) => e..count = _model.value,
                                          );
                                          FFAppState().update(() {});
                                        }
                                      }
                                    },
                                    child: Container(
                                      width: 48.0,
                                      height: 48.0,
                                      decoration: const BoxDecoration(),
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'qgfd27np' /* - */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 8.0),
                                    child: Text(
                                      '${formatNumber(
                                        _model.value,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                      )} шт',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (FFAppState()
                                          .orderForEdit
                                          .isNotEmpty) {
                                        _model.value = _model.value + 1;
                                        safeSetState(() {});
                                        FFAppState().updateOrderForEditAtIndex(
                                          widget.index!,
                                          (e) => e..count = _model.value,
                                        );
                                        FFAppState().update(() {});
                                      } else {
                                        FFAppState().orderForEdit = _model.order
                                            .toList()
                                            .cast<CartStruct>();
                                        safeSetState(() {});
                                        _model.value = _model.value + 1;
                                        safeSetState(() {});
                                        FFAppState().updateOrderForEditAtIndex(
                                          widget.index!,
                                          (e) => e..count = _model.value,
                                        );
                                        FFAppState().update(() {});
                                      }
                                    },
                                    child: Container(
                                      width: 48.0,
                                      height: 48.0,
                                      decoration: const BoxDecoration(),
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'hozg2w4j' /* + */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF0E6),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Text(
                                formatNumber(
                                  functions.summFunction(
                                      _model.value, widget.price!),
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.automatic,
                                  currency: '₩',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
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
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              FFAppState().removeAtIndexFromOrderForEdit(widget.index!);
              FFAppState().update(() {});
            },
            child: Icon(
              Icons.close,
              color: FlutterFlowTheme.of(context).accent4,
              size: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}
