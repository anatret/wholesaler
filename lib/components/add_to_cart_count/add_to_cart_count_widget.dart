import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_to_cart_count_model.dart';
export 'add_to_cart_count_model.dart';

class AddToCartCountWidget extends StatefulWidget {
  const AddToCartCountWidget({
    super.key,
    required this.prodDoc,
  });

  final PizzaRecord? prodDoc;

  @override
  State<AddToCartCountWidget> createState() => _AddToCartCountWidgetState();
}

class _AddToCartCountWidgetState extends State<AddToCartCountWidget> {
  late AddToCartCountModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddToCartCountModel());

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
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: 120.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                  child: FlutterFlowCountController(
                    decrementIconBuilder: (enabled) => Icon(
                      Icons.remove_rounded,
                      color: enabled
                          ? FlutterFlowTheme.of(context).secondaryText
                          : FlutterFlowTheme.of(context).alternate,
                      size: 24.0,
                    ),
                    incrementIconBuilder: (enabled) => Icon(
                      Icons.add_rounded,
                      color: enabled
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).alternate,
                      size: 24.0,
                    ),
                    countBuilder: (count) => Text(
                      count.toString(),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Outfit',
                            letterSpacing: 0.0,
                          ),
                    ),
                    count: _model.countControllerValue ??= 1,
                    updateCount: (count) =>
                        safeSetState(() => _model.countControllerValue = count),
                    stepSize: 1,
                    minimum: 1,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  ),
                ),
              ),
              Text(
                formatNumber(
                  functions.summFunction(
                      _model.countControllerValue!, widget.prodDoc!.price),
                  formatType: FormatType.decimal,
                  decimalType: DecimalType.automatic,
                  currency: '₩',
                ),
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Outfit',
                      letterSpacing: 0.0,
                    ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).primary,
                  borderRadius: 50.0,
                  buttonSize: 50.0,
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    if (FFAppState().wholeSalerinCart == null) {
                      FFAppState().addToCart(CartStruct(
                        pizza: widget.prodDoc?.reference,
                        price: widget.prodDoc?.price,
                        count: _model.countControllerValue,
                      ));
                      FFAppState().wholeSalerinCart = widget.prodDoc?.store;
                      safeSetState(() {});
                    } else if ((FFAppState().wholeSalerinCart != null) &&
                        (FFAppState().wholeSalerinCart ==
                            widget.prodDoc?.store)) {
                      FFAppState().addToCart(CartStruct(
                        pizza: widget.prodDoc?.reference,
                        price: widget.prodDoc?.price,
                        count: _model.countControllerValue,
                      ));
                      safeSetState(() {});
                    } else {
                      var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: const Text('Ошибка добавления'),
                                content: const Text(
                                    'В корзине уже находятся товары от другого поставщика. Пожалуйста, завершите оформление текущего заказа или очистите корзину, чтобы добавить новый товар.'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: const Text('Отмена'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: const Text('Очистить и добавить '),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                      if (confirmDialogResponse) {
                        FFAppState().cart = [];
                        FFAppState().wholeSalerinCart = null;
                        safeSetState(() {});
                        FFAppState().addToCart(CartStruct(
                          pizza: widget.prodDoc?.reference,
                          price: widget.prodDoc?.price,
                          count: _model.countControllerValue,
                        ));
                        FFAppState().wholeSalerinCart = widget.prodDoc?.store;
                        safeSetState(() {});
                      } else {
                        return;
                      }
                    }

                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Товар добавлен в корзину',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        duration: const Duration(milliseconds: 1500),
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
