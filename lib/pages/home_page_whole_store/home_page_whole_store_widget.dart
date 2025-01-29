import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/banner_item/banner_item_widget.dart';
import '/components/empty_product_list/empty_product_list_widget.dart';
import '/components/often_ordered/often_ordered_widget.dart';
import '/components/whole_store_item/whole_store_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:badges/badges.dart' as badges;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'home_page_whole_store_model.dart';
export 'home_page_whole_store_model.dart';

class HomePageWholeStoreWidget extends StatefulWidget {
  const HomePageWholeStoreWidget({super.key});

  @override
  State<HomePageWholeStoreWidget> createState() =>
      _HomePageWholeStoreWidgetState();
}

class _HomePageWholeStoreWidgetState extends State<HomePageWholeStoreWidget> {
  late HomePageWholeStoreModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageWholeStoreModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      Function() navigate = () {};
      // checkStore
      _model.usersStore = await queryStoresRecordOnce(
        queryBuilder: (storesRecord) => storesRecord.where(
          'user',
          isEqualTo: currentUserReference,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.usersStore != null) {
        if (_model.usersStore?.verifyStatus == VerifyStatus.done) {
        } else {
          GoRouter.of(context).prepareAuthEvent();
          await authManager.signOut();
          GoRouter.of(context).clearRedirectLocation();

          navigate = () => context.goNamedAuth('AuthPage', context.mounted);
        }
      } else {
        GoRouter.of(context).prepareAuthEvent();
        await authManager.signOut();
        GoRouter.of(context).clearRedirectLocation();

        navigate = () => context.goNamedAuth('AuthPage', context.mounted);
      }

      navigate();
    });

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

    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<List<PizzaRecord>>(
        stream: queryPizzaRecord(
          queryBuilder: (pizzaRecord) => pizzaRecord
              .where(
                'isDeleted',
                isEqualTo: _model.showDeletedCheckboxValue ?? false,
              )
              .where(
                'productType',
                isEqualTo: _model.tap?.serialize(),
              )
              .where(
                'store',
                isEqualTo: currentUserDocument?.userType == UserTypes.manager
                    ? FFAppState().userStore
                    : null,
              ),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              body: Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              ),
            );
          }
          List<PizzaRecord> homePageWholeStorePizzaRecordList = snapshot.data!;

          return Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                print('FloatingActionButton pressed ...');
              },
              backgroundColor: FlutterFlowTheme.of(context).primary,
              elevation: 8.0,
              child: Builder(
                builder: (context) {
                  if (currentUserDocument?.userType != UserTypes.manager) {
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'CartPage',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.scale,
                              alignment: Alignment.bottomCenter,
                            ),
                          },
                        );
                      },
                      child: Stack(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        children: [
                          Icon(
                            Icons.shopping_cart_outlined,
                            color: FlutterFlowTheme.of(context).info,
                            size: 24.0,
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
                    );
                  } else {
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'AddProduct',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.scale,
                              alignment: Alignment.bottomCenter,
                            ),
                          },
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: const BoxDecoration(),
                        child: Stack(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          children: [
                            Icon(
                              Icons.add,
                              color: FlutterFlowTheme.of(context).info,
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(58.0),
              child: AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                title: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'qgqv4sff' /* WholeSaler */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (currentUserDocument?.userType !=
                                UserTypes.manager)
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'SearchPage',
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
                                  child: Icon(
                                    Icons.search,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 26.0,
                                  ),
                                ),
                              ),
                            badges.Badge(
                              badgeContent: Text(
                                FFLocalizations.of(context).getText(
                                  '8knbeohg' /* 1 */,
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
                              showBadge: true,
                              shape: badges.BadgeShape.circle,
                              badgeColor: FlutterFlowTheme.of(context).primary,
                              elevation: 0.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              position: badges.BadgePosition.topEnd(),
                              animationType: badges.BadgeAnimationType.scale,
                              toAnimate: true,
                              child: Icon(
                                Icons.notifications_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 26.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                actions: const [],
                centerTitle: false,
                toolbarHeight: 58.0,
                elevation: 0.0,
              ),
            ),
            body: Align(
              alignment: const AlignmentDirectional(0.0, -1.0),
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 450.0,
                ),
                decoration: const BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 4.0, 16.0, 16.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'k3ci3v2w' /* Часто заказывают */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          final offenOrderedList =
                              homePageWholeStorePizzaRecordList
                                  .where((e) => e.oftenOrdered == true)
                                  .toList();

                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(offenOrderedList.length,
                                      (offenOrderedListIndex) {
                                final offenOrderedListItem =
                                    offenOrderedList[offenOrderedListIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'ProductDeckPage',
                                      queryParameters: {
                                        'productRef': serializeParam(
                                          offenOrderedListItem.reference,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: wrapWithModel(
                                    model: _model.oftenOrderedModels.getModel(
                                      offenOrderedListIndex.toString(),
                                      offenOrderedListIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: OftenOrderedWidget(
                                      key: Key(
                                        'Key9wn_${offenOrderedListIndex.toString()}',
                                      ),
                                      img: offenOrderedListItem.img,
                                      name: offenOrderedListItem.name,
                                      price: offenOrderedListItem.price,
                                    ),
                                  ),
                                );
                              })
                                  .divide(const SizedBox(width: 8.0))
                                  .addToStart(const SizedBox(width: 16.0))
                                  .addToEnd(const SizedBox(width: 16.0)),
                            ),
                          );
                        },
                      ),
                      Builder(
                        builder: (context) {
                          if (currentUserDocument?.userType !=
                              UserTypes.manager) {
                            return StreamBuilder<List<BanersRecord>>(
                              stream: queryBanersRecord(),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<BanersRecord> rowBanersRecordList =
                                    snapshot.data!;

                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children:
                                        List.generate(
                                                rowBanersRecordList.length,
                                                (rowIndex) {
                                      final rowBanersRecord =
                                          rowBanersRecordList[rowIndex];
                                      return Builder(
                                        builder: (context) => Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 12.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        const AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: SizedBox(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          1.0,
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      child: BannerItemWidget(
                                                        url:
                                                            rowBanersRecord.url,
                                                        baner: rowBanersRecord
                                                            .reference,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 2.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Container(
                                                width: 120.0,
                                                height: 160.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  image: DecorationImage(
                                                    fit: BoxFit.contain,
                                                    image: Image.network(
                                                      rowBanersRecord.url,
                                                    ).image,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    })
                                            .divide(const SizedBox(width: 8.0))
                                            .addToStart(const SizedBox(width: 16.0))
                                            .addToEnd(const SizedBox(width: 16.0)),
                                  ),
                                );
                              },
                            );
                          } else {
                            return StreamBuilder<List<BanersRecord>>(
                              stream: queryBanersRecord(
                                queryBuilder: (banersRecord) =>
                                    banersRecord.where(
                                  'storeRef',
                                  isEqualTo: FFAppState().userStore,
                                ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<BanersRecord> rowBanersRecordList =
                                    snapshot.data!;

                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children:
                                        List.generate(
                                                rowBanersRecordList.length,
                                                (rowIndex) {
                                      final rowBanersRecord =
                                          rowBanersRecordList[rowIndex];
                                      return Builder(
                                        builder: (context) => Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 12.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        const AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: SizedBox(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          1.0,
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      child: BannerItemWidget(
                                                        url:
                                                            rowBanersRecord.url,
                                                        baner: rowBanersRecord
                                                            .reference,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 2.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Container(
                                                width: 120.0,
                                                height: 160.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  image: DecorationImage(
                                                    fit: BoxFit.contain,
                                                    image: Image.network(
                                                      rowBanersRecord.url,
                                                    ).image,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    })
                                            .divide(const SizedBox(width: 8.0))
                                            .addToStart(const SizedBox(width: 16.0))
                                            .addToEnd(const SizedBox(width: 16.0)),
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if ((currentUserDocument?.userType ==
                                  UserTypes.manager) ||
                              (currentUserDocument?.userType ==
                                  UserTypes.admin))
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'rz7o2sbd' /* Показать удаленые */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        visualDensity: VisualDensity.compact,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                    ),
                                    child: Checkbox(
                                      value: _model.showDeletedCheckboxValue ??=
                                          false,
                                      onChanged: (newValue) async {
                                        safeSetState(() =>
                                            _model.showDeletedCheckboxValue =
                                                newValue!);
                                      },
                                      side: BorderSide(
                                        width: 2,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      checkColor:
                                          FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final uniqStores =
                                    homePageWholeStorePizzaRecordList
                                        .unique((e) => e.store!)
                                        .toList();
                                if (uniqStores.isEmpty) {
                                  return const EmptyProductListWidget();
                                }

                                return ListView.builder(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    0,
                                    0,
                                    60.0,
                                  ),
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: uniqStores.length,
                                  itemBuilder: (context, uniqStoresIndex) {
                                    final uniqStoresItem =
                                        uniqStores[uniqStoresIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'WholeStorePage',
                                          queryParameters: {
                                            'wholeStore': serializeParam(
                                              uniqStoresItem.store,
                                              ParamType.DocumentReference,
                                            ),
                                            'productType': serializeParam(
                                              _model.tap,
                                              ParamType.Enum,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: const TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      },
                                      child: wrapWithModel(
                                        model: _model.wholeStoreItemModels
                                            .getModel(
                                          uniqStoresIndex.toString(),
                                          uniqStoresIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: WholeStoreItemWidget(
                                          key: Key(
                                            'Keyh1s_${uniqStoresIndex.toString()}',
                                          ),
                                          storeDoc: uniqStoresItem.store,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ].addToEnd(const SizedBox(height: 24.0)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
