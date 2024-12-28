import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'payment_model.dart';
export 'payment_model.dart';

class PaymentWidget extends StatefulWidget {
  const PaymentWidget({super.key});

  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  late PaymentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'fohtynin' /* Subscription / Payment */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Outfit',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'ixo7t97c' /* Your Subscription */,
                  ),
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 5.0,
                        color: Color(0x34111417),
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              unselectedWidgetColor: const Color(0xFF95A1AC),
                            ),
                            child: CheckboxListTile(
                              value: _model.checkboxListTileValue1 ??= true,
                              onChanged: (newValue) async {
                                safeSetState(() =>
                                    _model.checkboxListTileValue1 = newValue!);
                              },
                              title: Text(
                                FFLocalizations.of(context).getText(
                                  'jva11say' /* Monthly */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              subtitle: Text(
                                FFLocalizations.of(context).getText(
                                  'pp0pb58t' /* $15.99/mo */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              activeColor: FlutterFlowTheme.of(context).primary,
                              checkColor: Colors.white,
                              dense: false,
                              controlAffinity: ListTileControlAffinity.trailing,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 24.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '00bk6umn' /* Gain unlimited access to all t... */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'k5b8ia5r' /* Other Offers */,
                  ),
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 5.0,
                        color: Color(0x34111417),
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              unselectedWidgetColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                            child: CheckboxListTile(
                              value: _model.checkboxListTileValue2 ??= false,
                              onChanged: (newValue) async {
                                safeSetState(() =>
                                    _model.checkboxListTileValue2 = newValue!);
                              },
                              title: Text(
                                FFLocalizations.of(context).getText(
                                  'wgpuv0cv' /* Annual (save $12) */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              subtitle: Text(
                                FFLocalizations.of(context).getText(
                                  'm3ibs5ms' /* $180/yr */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              activeColor: FlutterFlowTheme.of(context).primary,
                              checkColor: Colors.white,
                              dense: false,
                              controlAffinity: ListTileControlAffinity.trailing,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 24.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'xxtkmyeu' /* Gain unlimited access to all t... */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 5.0,
                        color: Color(0x34111417),
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                    child: Material(
                      color: Colors.transparent,
                      child: Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                        child: CheckboxListTile(
                          value: _model.checkboxListTileValue3 ??= false,
                          onChanged: (newValue) async {
                            safeSetState(() =>
                                _model.checkboxListTileValue3 = newValue!);
                          },
                          title: Text(
                            FFLocalizations.of(context).getText(
                              'm3w3vp7s' /* Free Limited Access */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                  lineHeight: 1.5,
                                ),
                          ),
                          subtitle: Text(
                            FFLocalizations.of(context).getText(
                              'ua5dne1y' /* Continue with limited access a... */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          activeColor: FlutterFlowTheme.of(context).primary,
                          checkColor: Colors.white,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
