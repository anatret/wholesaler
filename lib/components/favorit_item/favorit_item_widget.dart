import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorit_item_model.dart';
export 'favorit_item_model.dart';

class FavoritItemWidget extends StatefulWidget {
  const FavoritItemWidget({
    super.key,
    required this.name,
    required this.deskription,
    required this.price,
    required this.image,
    required this.ref,
  });

  final String? name;
  final String? deskription;
  final int? price;
  final String? image;
  final DocumentReference? ref;

  @override
  State<FavoritItemWidget> createState() => _FavoritItemWidgetState();
}

class _FavoritItemWidgetState extends State<FavoritItemWidget> {
  late FavoritItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoritItemModel());
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
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
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
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.name,
                      'Название продукта',
                    ),
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.deskription,
                      'Описание продукта',
                    ).maybeHandleOverflow(
                      maxChars: 50,
                      replacement: '…',
                    ),
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          fontFamily: 'Readex Pro',
                          color: const Color(0xFF5B5B5B),
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                      child: Container(
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
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                          ),
                        ),
                      ),
                    ),
                    ToggleIcon(
                      onPressed: () async {
                        safeSetState(
                          () => FFAppState().favorits.contains(widget.ref)
                              ? FFAppState().removeFromFavorits(widget.ref!)
                              : FFAppState().addToFavorits(widget.ref!),
                        );

                        FFAppState().update(() {});
                      },
                      value: FFAppState().favorits.contains(widget.ref),
                      onIcon: Icon(
                        Icons.favorite_rounded,
                        color: FlutterFlowTheme.of(context).error,
                        size: 24.0,
                      ),
                      offIcon: Icon(
                        Icons.favorite_border,
                        color: FlutterFlowTheme.of(context).error,
                        size: 24.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
