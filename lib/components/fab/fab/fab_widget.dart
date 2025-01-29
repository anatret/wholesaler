import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'fab_model.dart';
export 'fab_model.dart';

class FabWidget extends StatefulWidget {
  const FabWidget({super.key});

  @override
  State<FabWidget> createState() => _FabWidgetState();
}

class _FabWidgetState extends State<FabWidget> with TickerProviderStateMixin {
  late FabModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FabModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
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
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(-20.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: const Offset(-20.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 600.0.ms,
            begin: const Offset(-20.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: const Offset(-20.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 800.0.ms,
            duration: 600.0.ms,
            begin: const Offset(-20.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 800.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation7': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(-20.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
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
            true,
          ))
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                width: 160.0,
                decoration: BoxDecoration(
                  color: const Color(0xFF14282B),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: const BoxDecoration(
                          color: Color(0xFF14282B),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.photo_outlined,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 26.0,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'kzxdwwjv' /* Hello World */,
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
                      ).animateOnActionTrigger(
                        animationsMap['containerOnActionTriggerAnimation2']!,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: const BoxDecoration(
                          color: Color(0xFF14282B),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.insert_drive_file_outlined,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 26.0,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'dpfy09vs' /* FILES */,
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
                      ).animateOnActionTrigger(
                        animationsMap['containerOnActionTriggerAnimation3']!,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: const BoxDecoration(
                          color: Color(0xFF14282B),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.mic_none,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 26.0,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'sryoxnxh' /* RECORD */,
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
                      ).animateOnActionTrigger(
                        animationsMap['containerOnActionTriggerAnimation4']!,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: const BoxDecoration(
                          color: Color(0xFF14282B),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 26.0,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'c79hf27i' /* LOCATION */,
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
                      ).animateOnActionTrigger(
                        animationsMap['containerOnActionTriggerAnimation5']!,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: const BoxDecoration(
                          color: Color(0xFF14282B),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.payment,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 26.0,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'r7enoqmt' /* Pay */,
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
                      ).animateOnActionTrigger(
                        animationsMap['containerOnActionTriggerAnimation6']!,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: const BoxDecoration(
                          color: Color(0xFF14282B),
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
                                    '0uinxmo8' /* Edit */,
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
                      ).animateOnActionTrigger(
                        animationsMap['containerOnActionTriggerAnimation7']!,
                      ),
                    ],
                  ),
                ),
              ),
            ).animateOnActionTrigger(
              animationsMap['containerOnActionTriggerAnimation1']!,
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
                  if (animationsMap['containerOnActionTriggerAnimation1'] !=
                      null) {
                    animationsMap['containerOnActionTriggerAnimation1']!
                        .controller
                        .reverse();
                  }
                  if (animationsMap['containerOnActionTriggerAnimation2'] !=
                      null) {
                    animationsMap['containerOnActionTriggerAnimation2']!
                        .controller
                        .reverse();
                  }
                  if (animationsMap['containerOnActionTriggerAnimation3'] !=
                      null) {
                    animationsMap['containerOnActionTriggerAnimation3']!
                        .controller
                        .reverse();
                  }
                  if (animationsMap['containerOnActionTriggerAnimation4'] !=
                      null) {
                    animationsMap['containerOnActionTriggerAnimation4']!
                        .controller
                        .reverse();
                  }
                  if (animationsMap['containerOnActionTriggerAnimation5'] !=
                      null) {
                    animationsMap['containerOnActionTriggerAnimation5']!
                        .controller
                        .reverse();
                  }
                  if (animationsMap['containerOnActionTriggerAnimation6'] !=
                      null) {
                    animationsMap['containerOnActionTriggerAnimation6']!
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
                  await Future.delayed(const Duration(milliseconds: 100));
                  if (animationsMap['containerOnActionTriggerAnimation1'] !=
                      null) {
                    animationsMap['containerOnActionTriggerAnimation1']!
                        .controller
                        .forward(from: 0.0);
                  }
                  if (animationsMap['containerOnActionTriggerAnimation2'] !=
                      null) {
                    animationsMap['containerOnActionTriggerAnimation2']!
                        .controller
                        .forward(from: 0.0);
                  }
                  if (animationsMap['containerOnActionTriggerAnimation3'] !=
                      null) {
                    animationsMap['containerOnActionTriggerAnimation3']!
                        .controller
                        .forward(from: 0.0);
                  }
                  if (animationsMap['containerOnActionTriggerAnimation4'] !=
                      null) {
                    animationsMap['containerOnActionTriggerAnimation4']!
                        .controller
                        .forward(from: 0.0);
                  }
                  if (animationsMap['containerOnActionTriggerAnimation5'] !=
                      null) {
                    animationsMap['containerOnActionTriggerAnimation5']!
                        .controller
                        .forward(from: 0.0);
                  }
                  if (animationsMap['containerOnActionTriggerAnimation6'] !=
                      null) {
                    animationsMap['containerOnActionTriggerAnimation6']!
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
