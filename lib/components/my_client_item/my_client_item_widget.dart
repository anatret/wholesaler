import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'my_client_item_model.dart';
export 'my_client_item_model.dart';

class MyClientItemWidget extends StatefulWidget {
  const MyClientItemWidget({
    super.key,
    required this.clientname,
    required this.storename,
    required this.clientimage,
    required this.clientStatus,
  });

  final String? clientname;
  final String? storename;
  final String? clientimage;
  final ClientStatus? clientStatus;

  @override
  State<MyClientItemWidget> createState() => _MyClientItemWidgetState();
}

class _MyClientItemWidgetState extends State<MyClientItemWidget> {
  late MyClientItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyClientItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 0.0,
            color: FlutterFlowTheme.of(context).alternate,
            offset: const Offset(
              0.0,
              1.0,
            ),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.clientname,
                        'Имя Клиента',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.storename,
                        'Название магазина',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 36.0,
              height: 36.0,
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    widget.clientimage!,
                    width: 120.0,
                    height: 120.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).accent2,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).secondary,
                      ),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.clientStatus?.name,
                            'статус',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
