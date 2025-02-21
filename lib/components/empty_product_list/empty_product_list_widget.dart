import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_product_list_model.dart';
export 'empty_product_list_model.dart';

class EmptyProductListWidget extends StatefulWidget {
  const EmptyProductListWidget({super.key});

  @override
  State<EmptyProductListWidget> createState() => _EmptyProductListWidgetState();
}

class _EmptyProductListWidgetState extends State<EmptyProductListWidget> {
  late EmptyProductListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyProductListModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_cart_outlined,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 64.0,
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'op8hx0ue' /* Ваш список товаров пуст */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Outfit',
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  '3lturs96' /* Добавьте товары через админ па... */,
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
      ),
    );
  }
}
