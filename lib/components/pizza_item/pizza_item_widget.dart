import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'pizza_item_model.dart';
export 'pizza_item_model.dart';

class PizzaItemWidget extends StatefulWidget {
  const PizzaItemWidget({
    super.key,
    required this.name,
    required this.deskription,
    required this.price,
    required this.image,
    bool? instock,
    this.refproduct,
  }) : instock = instock ?? true;

  final String? name;
  final String? deskription;
  final int? price;
  final String? image;
  final bool instock;
  final DocumentReference? refproduct;

  @override
  State<PizzaItemWidget> createState() => _PizzaItemWidgetState();
}

class _PizzaItemWidgetState extends State<PizzaItemWidget>
    with TickerProviderStateMixin {
  late PizzaItemModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PizzaItemModel());

    animationsMap.addAll({
      'stackOnPageLoadAnimation': AnimationInfo(
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

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
      child: Stack(
        alignment: const AlignmentDirectional(0.0, 0.0),
        children: [
          Opacity(
            opacity: widget.instock ? 1.0 : 0.25,
            child: Container(
              width: double.infinity,
              height: 160.0,
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
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            widget.image!,
                            width: 160.0,
                            height: 200.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      if (functions.checkCart(
                          FFAppState()
                              .cart
                              .map((e) => e.pizza)
                              .withoutNulls
                              .toList(),
                          widget.refproduct!))
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: 36.0,
                              height: 36.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: Icon(
                                Icons.add_shopping_cart,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 6.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.name,
                              'Название продукта',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.deskription,
                              'Описание продукта',
                            ).maybeHandleOverflow(
                              maxChars: 40,
                              replacement: '…',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: const Color(0xFF5B5B5B),
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF0E6),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                18.0, 9.0, 18.0, 9.0),
                            child: Text(
                              formatNumber(
                                widget.price,
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
                  ),
                ],
              ),
            ),
          ),
          if (!widget.instock)
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'f8im7su4' /* Будет позже */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
        ],
      ).animateOnPageLoad(animationsMap['stackOnPageLoadAnimation']!),
    );
  }
}
