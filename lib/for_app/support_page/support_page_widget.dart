import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'support_page_model.dart';
export 'support_page_model.dart';

class SupportPageWidget extends StatefulWidget {
  const SupportPageWidget({super.key});

  @override
  State<SupportPageWidget> createState() => _SupportPageWidgetState();
}

class _SupportPageWidgetState extends State<SupportPageWidget> {
  late SupportPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupportPageModel());
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Align(
          alignment: const AlignmentDirectional(0.0, -1.0),
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 970.0,
            ),
            decoration: const BoxDecoration(),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                    ))
                      Container(
                        width: double.infinity,
                        height: 24.0,
                        decoration: const BoxDecoration(),
                      ),
                    Material(
                      color: Colors.transparent,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF3E0),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const Icon(
                                    Icons.warning_amber_rounded,
                                    color: Color(0xFFFF6F00),
                                    size: 24.0,
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '0k35hdbu' /* Техническая поддержка */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: const Color(0xFFFF6F00),
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].divide(const SizedBox(width: 12.0)),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'm5rc1rqn' /* If you have a question regardi... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: const Color(0xFFFF6F00),
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ].divide(const SizedBox(height: 12.0)),
                          ),
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(height: 24.0)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
