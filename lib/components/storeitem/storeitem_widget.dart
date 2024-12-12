import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'storeitem_model.dart';
export 'storeitem_model.dart';

class StoreitemWidget extends StatefulWidget {
  const StoreitemWidget({
    super.key,
    required this.address,
    required this.nameStore,
  });

  final String? address;
  final String? nameStore;

  @override
  State<StoreitemWidget> createState() => _StoreitemWidgetState();
}

class _StoreitemWidgetState extends State<StoreitemWidget> {
  late StoreitemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StoreitemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
          child: Icon(
            Icons.map_outlined,
            color: FlutterFlowTheme.of(context).primary,
            size: 16.0,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              valueOrDefault<String>(
                widget.nameStore,
                'Магазин',
              ),
              style: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Readex Pro',
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Text(
              valueOrDefault<String>(
                widget.address,
                'адрес',
              ),
              style: FlutterFlowTheme.of(context).labelSmall.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0.0,
                  ),
            ),
            if (false)
              Text(
                FFLocalizations.of(context).getText(
                  'e99y4tff' /* Изменить */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).primary,
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                    ),
              ),
          ].divide(const SizedBox(height: 6.0)),
        ),
      ],
    );
  }
}
