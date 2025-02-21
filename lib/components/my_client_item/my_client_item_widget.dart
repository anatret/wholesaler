import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'my_client_item_model.dart';
export 'my_client_item_model.dart';

class MyClientItemWidget extends StatefulWidget {
  const MyClientItemWidget({
    super.key,
    required this.userRef,
  });

  final DocumentReference? userRef;

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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
      child: StreamBuilder<UserRecord>(
        stream: UserRecord.getDocument(widget.userRef!),
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

          final containerUserRecord = snapshot.data!;

          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 0.0,
                  color: FlutterFlowTheme.of(context).alternate,
                  offset: Offset(
                    0.0,
                    1.0,
                  ),
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 6.0, 16.0, 6.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            containerUserRecord.displayName,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: StreamBuilder<List<StoresRecord>>(
                            stream: queryStoresRecord(
                              queryBuilder: (storesRecord) =>
                                  storesRecord.where(
                                'user',
                                isEqualTo: widget.userRef,
                              ),
                              singleRecord: true,
                            ),
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
                              List<StoresRecord> textStoresRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final textStoresRecord =
                                  textStoresRecordList.isNotEmpty
                                      ? textStoresRecordList.first
                                      : null;

                              return Text(
                                valueOrDefault<String>(
                                  () {
                                    if (!(textStoresRecord != null)) {
                                      return valueOrDefault<String>(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          ruText: 'Магазин не создан',
                                          enText: 'Магазин не создан',
                                          koText: 'Магазин не создан',
                                          zh_HansText: 'Магазин не создан',
                                        ),
                                        'Магазин не создан',
                                      );
                                    } else if ((textStoresRecord != null) &&
                                        (textStoresRecord.storeName !=
                                                '')) {
                                      return textStoresRecord.storeName;
                                    } else {
                                      return valueOrDefault<String>(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          ruText: 'Empty',
                                          enText: 'Empty',
                                          koText: 'Empty',
                                          zh_HansText: 'Empty',
                                        ),
                                        'Empty',
                                      );
                                    }
                                  }(),
                                  'Empty',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                    ),
                              );
                            },
                          ),
                        ),
                        Text(
                          dateTimeFormat(
                            "yMMMd",
                            containerUserRecord.createdTime!,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 6.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'i4f3zs1t' /* exp. date */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              dateTimeFormat(
                                "yMMMd",
                                containerUserRecord.expireDate,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              'expireDate',
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
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
