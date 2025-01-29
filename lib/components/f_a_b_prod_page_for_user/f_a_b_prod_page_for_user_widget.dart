import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'f_a_b_prod_page_for_user_model.dart';
export 'f_a_b_prod_page_for_user_model.dart';

class FABProdPageForUserWidget extends StatefulWidget {
  const FABProdPageForUserWidget({
    super.key,
    required this.wholeStore,
  });

  final DocumentReference? wholeStore;

  @override
  State<FABProdPageForUserWidget> createState() =>
      _FABProdPageForUserWidgetState();
}

class _FABProdPageForUserWidgetState extends State<FABProdPageForUserWidget>
    with TickerProviderStateMixin {
  late FABProdPageForUserModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FABProdPageForUserModel());

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

    return Container(
      width: 100.0,
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (valueOrDefault<bool>(
              FFAppState().isFabExpdProdPag,
              false,
            ))
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Container(
                  width: 65.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryText,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                          child: StreamBuilder<StoresRecord>(
                            stream:
                                StoresRecord.getDocument(widget.wholeStore!),
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

                              final iconButtonStoresRecord = snapshot.data!;

                              return FlutterFlowIconButton(
                                borderRadius: 50.0,
                                buttonSize: double.infinity,
                                fillColor: FlutterFlowTheme.of(context).success,
                                icon: Icon(
                                  Icons.phone_sharp,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  await launchUrl(Uri(
                                    scheme: 'tel',
                                    path: iconButtonStoresRecord.phone,
                                  ));
                                },
                              );
                            },
                          ),
                        ).animateOnActionTrigger(
                          animationsMap['containerOnActionTriggerAnimation2']!,
                        ),
                        Container(
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                          child: Stack(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            children: [
                              FlutterFlowIconButton(
                                borderRadius: 50.0,
                                buttonSize: double.infinity,
                                fillColor: FlutterFlowTheme.of(context).primary,
                                icon: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  context.pushNamed(
                                    'CartPage',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.scale,
                                        alignment: Alignment.bottomCenter,
                                      ),
                                    },
                                  );
                                },
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.6, -0.6),
                                child: Text(
                                  valueOrDefault<String>(
                                    functions
                                        .getSizeOfCartList(
                                            FFAppState().cart.toList())
                                        .toString(),
                                    '1',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ).animateOnActionTrigger(
                          animationsMap['containerOnActionTriggerAnimation3']!,
                        ),
                      ].divide(const SizedBox(height: 20.0)),
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
                    await Future.delayed(const Duration(milliseconds: 50));
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
                    child: SizedBox(
                      width: 65.0,
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
            ),
          ].divide(const SizedBox(height: 10.0)),
        ),
      ),
    );
  }
}
