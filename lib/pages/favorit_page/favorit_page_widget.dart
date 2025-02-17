import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/deckription_item/deckription_item_widget.dart';
import '/components/empty_cart/empty_cart_widget.dart';
import '/components/favorit_item/favorit_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'favorit_page_model.dart';
export 'favorit_page_model.dart';

class FavoritPageWidget extends StatefulWidget {
  const FavoritPageWidget({super.key});

  @override
  State<FavoritPageWidget> createState() => _FavoritPageWidgetState();
}

class _FavoritPageWidgetState extends State<FavoritPageWidget> {
  late FavoritPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoritPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(58.0),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 36.0,
                    height: 36.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'v72404gv' /* Избранное */,
                    ),
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                  FutureBuilder<int>(
                    future: queryUserReadRecordCount(
                      queryBuilder: (userReadRecord) => userReadRecord.where(
                        'userRef',
                        isEqualTo: currentUserReference,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 26.0,
                            height: 26.0,
                            child: SpinKitRipple(
                              color: FlutterFlowTheme.of(context).primary,
                              size: 26.0,
                            ),
                          ),
                        );
                      }
                      int containerCount = snapshot.data!;

                      return Container(
                        height: 36.0,
                        decoration: BoxDecoration(),
                        child: FutureBuilder<int>(
                          future: queryNewsRecordCount(),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 26.0,
                                  height: 26.0,
                                  child: SpinKitRipple(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 26.0,
                                  ),
                                ),
                              );
                            }
                            int badgeCount = snapshot.data!;

                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'News',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.scale,
                                      alignment: Alignment.bottomCenter,
                                    ),
                                  },
                                );
                              },
                              child: badges.Badge(
                                badgeContent: Text(
                                  valueOrDefault<String>(
                                    (badgeCount - containerCount).toString(),
                                    '0',
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                showBadge: valueOrDefault<String>(
                                      (badgeCount - containerCount).toString(),
                                      '0',
                                    ) !=
                                    '0',
                                shape: badges.BadgeShape.circle,
                                badgeColor:
                                    FlutterFlowTheme.of(context).primary,
                                elevation: 0.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 8.0, 8.0),
                                position: badges.BadgePosition.topEnd(),
                                animationType: badges.BadgeAnimationType.scale,
                                toAnimate: true,
                                child: Icon(
                                  Icons.notifications_outlined,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 26.0,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          toolbarHeight: 58.0,
          elevation: 0.0,
        ),
      ),
      body: Align(
        alignment: AlignmentDirectional(0.0, -1.0),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 450.0,
          ),
          decoration: BoxDecoration(),
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Builder(
                  builder: (context) {
                    final favorits = FFAppState().favorits.toList();
                    if (favorits.isEmpty) {
                      return EmptyCartWidget(
                        page: 'favorit',
                      );
                    }

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(favorits.length, (favoritsIndex) {
                        final favoritsItem = favorits[favoritsIndex];
                        return StreamBuilder<PizzaRecord>(
                          stream: PizzaRecord.getDocument(favoritsItem),
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

                            final containerPizzaRecord = snapshot.data!;

                            return Container(
                              decoration: BoxDecoration(),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.9,
                                          child: DeckriptionItemWidget(
                                            name: containerPizzaRecord.name,
                                            deskription: containerPizzaRecord
                                                .description,
                                            price: containerPizzaRecord.price,
                                            image: containerPizzaRecord.img,
                                            ref: containerPizzaRecord.reference,
                                            document: containerPizzaRecord,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: wrapWithModel(
                                  model: _model.favoritItemModels.getModel(
                                    favoritsIndex.toString(),
                                    favoritsIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: FavoritItemWidget(
                                    key: Key(
                                      'Keyyw4_${favoritsIndex.toString()}',
                                    ),
                                    name: containerPizzaRecord.name,
                                    deskription:
                                        containerPizzaRecord.description,
                                    price: containerPizzaRecord.price,
                                    image: containerPizzaRecord.img,
                                    ref: containerPizzaRecord.reference,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
