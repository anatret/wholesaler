import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'search_empty_model.dart';
export 'search_empty_model.dart';

class SearchEmptyWidget extends StatefulWidget {
  const SearchEmptyWidget({super.key});

  @override
  State<SearchEmptyWidget> createState() => _SearchEmptyWidgetState();
}

class _SearchEmptyWidgetState extends State<SearchEmptyWidget> {
  late SearchEmptyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchEmptyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 300.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 64.0,
            ),
            Text(
              FFLocalizations.of(context).getText(
                'ita9oj69' /* Ничего не найдено */,
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily: 'Outfit',
                    letterSpacing: 0.0,
                  ),
            ),
            Text(
              FFLocalizations.of(context).getText(
                '68r58ats' /* Попробуйте изменить запрос или... */,
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                  ),
            ),
          ].divide(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
