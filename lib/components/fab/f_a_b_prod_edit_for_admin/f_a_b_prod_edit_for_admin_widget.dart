import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'f_a_b_prod_edit_for_admin_model.dart';
export 'f_a_b_prod_edit_for_admin_model.dart';

class FABProdEditForAdminWidget extends StatefulWidget {
  const FABProdEditForAdminWidget({
    super.key,
    required this.prodRef,
  });

  final DocumentReference? prodRef;

  @override
  State<FABProdEditForAdminWidget> createState() =>
      _FABProdEditForAdminWidgetState();
}

class _FABProdEditForAdminWidgetState extends State<FABProdEditForAdminWidget>
    with TickerProviderStateMixin {
  late FABProdEditForAdminModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FABProdEditForAdminModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'transformOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(30.0, -30.0),
          ),
        ],
      ),
      'iconOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 1.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    // On component dispose action.
    () async {
      FFAppState().isFabExpdProdPag = false;
      safeSetState(() {});
    }();

    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (valueOrDefault<bool>(
            FFAppState().isFabExpdProdPag,
            false,
          ))
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                width: 170.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryText,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'EditCopyDeletProduct',
                            queryParameters: {
                              'isEdit': serializeParam(
                                true,
                                ParamType.bool,
                              ),
                              'productRef': serializeParam(
                                widget.prodRef,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.edit_note,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 26.0,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'msofcenn' /* Изменить */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (currentUserDocument?.userType == UserTypes.admin)
                        AuthUserStreamWidget(
                          builder: (context) => InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'SandNoticePage',
                                queryParameters: {
                                  'productRef': serializeParam(
                                    widget.prodRef,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.tap_and_play_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 26.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'afz9wf8c' /* Сообщение */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ).animateOnActionTrigger(
              animationsMap['containerOnActionTriggerAnimation']!,
            ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (FFAppState().isFabExpdProdPag) {
                  FFAppState().isFabExpdProdPag = false;
                  _model.updatePage(() {});
                  if (animationsMap['containerOnActionTriggerAnimation'] !=
                      null) {
                    animationsMap['containerOnActionTriggerAnimation']!
                        .controller
                        .reverse();
                  }
                  if (animationsMap['transformOnActionTriggerAnimation'] !=
                      null) {
                    animationsMap['transformOnActionTriggerAnimation']!
                        .controller
                        .reverse();
                  }
                  if (animationsMap['iconOnActionTriggerAnimation'] != null) {
                    animationsMap['iconOnActionTriggerAnimation']!
                        .controller
                        .reverse();
                  }
                } else {
                  FFAppState().isFabExpdProdPag = true;
                  _model.updatePage(() {});
                  await Future.delayed(const Duration(milliseconds: 50));
                  if (animationsMap['containerOnActionTriggerAnimation'] !=
                      null) {
                    animationsMap['containerOnActionTriggerAnimation']!
                        .controller
                        .forward(from: 0.0);
                  }
                  if (animationsMap['transformOnActionTriggerAnimation'] !=
                      null) {
                    animationsMap['transformOnActionTriggerAnimation']!
                        .controller
                        .forward(from: 0.0);
                  }
                  if (animationsMap['iconOnActionTriggerAnimation'] != null) {
                    animationsMap['iconOnActionTriggerAnimation']!
                        .controller
                        .forward(from: 0.0);
                  }
                }
              },
              child: ClipOval(
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    shape: BoxShape.circle,
                  ),
                  child: Stack(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    children: [
                      Transform.rotate(
                        angle: -45.0 * (math.pi / 180),
                        child: const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.send_rounded,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ),
                      ).animateOnActionTrigger(
                        animationsMap['transformOnActionTriggerAnimation']!,
                      ),
                      const Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                        size: 24.0,
                      ).animateOnActionTrigger(
                        animationsMap['iconOnActionTriggerAnimation']!,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
