import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/banner_item/banner_item_widget.dart';
import '/components/often_ordered/often_ordered_widget.dart';
import '/components/pizza_item/pizza_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:badges/badges.dart' as badges;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'whole_store_page_model.dart';
export 'whole_store_page_model.dart';

class WholeStorePageWidget extends StatefulWidget {
  const WholeStorePageWidget({
    super.key,
    this.wholeStore,
    required this.searchText,
    required this.productType,
  });

  final DocumentReference? wholeStore;
  final String? searchText;
  final ProductType? productType;

  @override
  State<WholeStorePageWidget> createState() => _WholeStorePageWidgetState();
}

class _WholeStorePageWidgetState extends State<WholeStorePageWidget> {
  late WholeStorePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WholeStorePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.tap = widget.productType;
      safeSetState(() {});
      if (widget.searchText != null && widget.searchText != '') {
        await queryPizzaRecordOnce()
            .then(
              (records) => _model.simpleSearchResults1 = TextSearch(
                records
                    .map(
                      (record) => TextSearchItem.fromTerms(record,
                          [record.name, record.description, record.barcode]),
                    )
                    .toList(),
              ).search(widget.searchText!).map((r) => r.object).toList(),
            )
            .onError((_, __) => _model.simpleSearchResults1 = [])
            .whenComplete(() => safeSetState(() {}));

        _model.isSearchDoing = true;
        safeSetState(() {});
        safeSetState(() {
          _model.searchTextFieldTextController?.text = widget.searchText!;
        });
      }
    });

    _model.searchTextFieldTextController ??= TextEditingController();
    _model.searchTextFieldFocusNode ??= FocusNode();

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

    return StreamBuilder<List<PizzaRecord>>(
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
              isEqualTo: widget.wholeStore,
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
        List<PizzaRecord> wholeStorePagePizzaRecordList = snapshot.data!;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(58.0),
            child: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              title: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: const BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 5.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.safePop();
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        badges.Badge(
                          badgeContent: Text(
                            FFLocalizations.of(context).getText(
                              'asv7rqlm' /* 1 */,
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
                  ),
                ],
              ),
              actions: const [],
              centerTitle: false,
              toolbarHeight: 58.0,
              elevation: 0.0,
            ),
          ),
          body: Stack(
            children: [
              ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              if (!_model.allCategorical) {
                                return GridView(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    crossAxisSpacing: 10.0,
                                    mainAxisSpacing: 5.0,
                                    childAspectRatio: 2.0,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (_model.tap == ProductType.vodka) {
                                          _model.tap = null;
                                          safeSetState(() {});
                                        } else {
                                          _model.tap = ProductType.vodka;
                                          safeSetState(() {});
                                        }
                                      },
                                      child: Container(
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x2B202529),
                                              offset: Offset(
                                                0.0,
                                                2.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  6.0, 6.0, 10.0, 6.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              if (false)
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 4.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: Image.asset(
                                                      'assets/images/pizzaicon.png',
                                                      width: 16.0,
                                                      height: 16.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'znrsu42u' /* Водка */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: _model.tap ==
                                                              ProductType.vodka
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (_model.tap == ProductType.vine) {
                                          _model.tap = null;
                                          safeSetState(() {});
                                        } else {
                                          _model.tap = ProductType.vine;
                                          safeSetState(() {});
                                        }
                                      },
                                      child: Container(
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x2B202529),
                                              offset: Offset(
                                                0.0,
                                                2.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  6.0, 6.0, 10.0, 6.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              if (false)
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 4.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: Image.asset(
                                                      'assets/images/zakuski.png',
                                                      width: 16.0,
                                                      height: 16.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'lwactj7f' /* Вино */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: _model.tap ==
                                                              ProductType.vine
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (_model.tap == ProductType.cognac) {
                                          _model.tap = null;
                                          safeSetState(() {});
                                        } else {
                                          _model.tap = ProductType.cognac;
                                          safeSetState(() {});
                                        }
                                      },
                                      child: Container(
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x2B202529),
                                              offset: Offset(
                                                0.0,
                                                2.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  6.0, 6.0, 10.0, 6.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              if (false)
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 4.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: Image.asset(
                                                      'assets/images/desert.png',
                                                      width: 16.0,
                                                      height: 16.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '1p2480ae' /* Коньяк */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: _model.tap ==
                                                              ProductType.cognac
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (_model.tap == ProductType.drinks) {
                                          _model.tap = null;
                                          safeSetState(() {});
                                        } else {
                                          _model.tap = ProductType.drinks;
                                          safeSetState(() {});
                                        }
                                      },
                                      child: Container(
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x2B202529),
                                              offset: Offset(
                                                0.0,
                                                2.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  6.0, 6.0, 10.0, 6.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              if (false)
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 4.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: Image.asset(
                                                      'assets/images/drinks.png',
                                                      width: 16.0,
                                                      height: 16.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'k3av8op1' /* Напитки */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: _model.tap ==
                                                              ProductType.drinks
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (_model.tap == ProductType.sauce) {
                                          _model.tap = null;
                                          safeSetState(() {});
                                        } else {
                                          _model.tap = ProductType.sauce;
                                          safeSetState(() {});
                                        }
                                      },
                                      child: Container(
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x2B202529),
                                              offset: Offset(
                                                0.0,
                                                2.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  6.0, 6.0, 10.0, 6.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              if (false)
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 4.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: Image.asset(
                                                      'assets/images/sous.png',
                                                      width: 16.0,
                                                      height: 16.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '26gbis1n' /* Соусы */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: _model.tap ==
                                                              ProductType.sauce
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (_model.tap ==
                                            ProductType.cannedfood) {
                                          _model.tap = null;
                                          safeSetState(() {});
                                        } else {
                                          _model.tap = ProductType.cannedfood;
                                          safeSetState(() {});
                                        }
                                      },
                                      child: Container(
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x2B202529),
                                              offset: Offset(
                                                0.0,
                                                2.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  6.0, 6.0, 10.0, 6.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              if (false)
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 4.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: Image.asset(
                                                      'assets/images/pizzaicon.png',
                                                      width: 16.0,
                                                      height: 16.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '04e29wi0' /* Консервы */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: _model.tap ==
                                                              ProductType
                                                                  .cannedfood
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (_model.tap == ProductType.grocery) {
                                          _model.tap = null;
                                          safeSetState(() {});
                                        } else {
                                          _model.tap = ProductType.grocery;
                                          safeSetState(() {});
                                        }
                                      },
                                      child: Container(
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x2B202529),
                                              offset: Offset(
                                                0.0,
                                                2.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  6.0, 6.0, 10.0, 6.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              if (false)
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 4.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: Image.asset(
                                                      'assets/images/pizzaicon.png',
                                                      width: 16.0,
                                                      height: 16.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '146l694s' /* Бакалея */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: _model.tap ==
                                                              ProductType
                                                                  .grocery
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.allCategorical = true;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x2B202529),
                                              offset: Offset(
                                                0.0,
                                                2.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  6.0, 6.0, 10.0, 6.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              if (false)
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 4.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: Image.asset(
                                                      'assets/images/pizzaicon.png',
                                                      width: 16.0,
                                                      height: 16.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'f4mepmin' /* еще... */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return Align(
                                  alignment: const AlignmentDirectional(1.0, -1.0),
                                  child: GridView(
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      crossAxisSpacing: 10.0,
                                      mainAxisSpacing: 5.0,
                                      childAspectRatio: 2.0,
                                    ),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.tap == ProductType.vodka) {
                                            _model.tap = null;
                                            safeSetState(() {});
                                          } else {
                                            _model.tap = ProductType.vodka;
                                            safeSetState(() {});
                                          }
                                        },
                                        child: Container(
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x2B202529),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 6.0, 10.0, 6.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                if (false)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                4.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/pizzaicon.png',
                                                        width: 16.0,
                                                        height: 16.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'x7g6fhfr' /* Водка */,
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: _model.tap ==
                                                                    ProductType
                                                                        .vodka
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.tap == ProductType.vine) {
                                            _model.tap = null;
                                            safeSetState(() {});
                                          } else {
                                            _model.tap = ProductType.vine;
                                            safeSetState(() {});
                                          }
                                        },
                                        child: Container(
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x2B202529),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 6.0, 10.0, 6.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                if (false)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                4.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/zakuski.png',
                                                        width: 16.0,
                                                        height: 16.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'zc85q7sl' /* Вино */,
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: _model.tap ==
                                                                    ProductType
                                                                        .vine
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.tap ==
                                              ProductType.cognac) {
                                            _model.tap = null;
                                            safeSetState(() {});
                                          } else {
                                            _model.tap = ProductType.cognac;
                                            safeSetState(() {});
                                          }
                                        },
                                        child: Container(
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x2B202529),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 6.0, 10.0, 6.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                if (false)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                4.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/desert.png',
                                                        width: 16.0,
                                                        height: 16.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'nxs5jmbl' /* Коньяк */,
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: _model.tap ==
                                                                    ProductType
                                                                        .cognac
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.tap ==
                                              ProductType.drinks) {
                                            _model.tap = null;
                                            safeSetState(() {});
                                          } else {
                                            _model.tap = ProductType.drinks;
                                            safeSetState(() {});
                                          }
                                        },
                                        child: Container(
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x2B202529),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 6.0, 10.0, 6.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                if (false)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                4.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/drinks.png',
                                                        width: 16.0,
                                                        height: 16.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '4j2mf2ij' /* Напитки */,
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: _model.tap ==
                                                                    ProductType
                                                                        .drinks
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.tap == ProductType.sauce) {
                                            _model.tap = null;
                                            safeSetState(() {});
                                          } else {
                                            _model.tap = ProductType.sauce;
                                            safeSetState(() {});
                                          }
                                        },
                                        child: Container(
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x2B202529),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 6.0, 10.0, 6.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                if (false)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                4.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/sous.png',
                                                        width: 16.0,
                                                        height: 16.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'd8icrzso' /* Соусы */,
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: _model.tap ==
                                                                    ProductType
                                                                        .sauce
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.tap ==
                                              ProductType.cannedfood) {
                                            _model.tap = null;
                                            safeSetState(() {});
                                          } else {
                                            _model.tap = ProductType.cannedfood;
                                            safeSetState(() {});
                                          }
                                        },
                                        child: Container(
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x2B202529),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 6.0, 10.0, 6.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                if (false)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                4.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/pizzaicon.png',
                                                        width: 16.0,
                                                        height: 16.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'sb2f9c2k' /* Консервы */,
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: _model.tap ==
                                                                    ProductType
                                                                        .cannedfood
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.tap ==
                                              ProductType.grocery) {
                                            _model.tap = null;
                                            safeSetState(() {});
                                          } else {
                                            _model.tap = ProductType.grocery;
                                            safeSetState(() {});
                                          }
                                        },
                                        child: Container(
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x2B202529),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 6.0, 10.0, 6.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                if (false)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                4.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/pizzaicon.png',
                                                        width: 16.0,
                                                        height: 16.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'g8odwtjg' /* Бакалея */,
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: _model.tap ==
                                                                    ProductType
                                                                        .grocery
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.tap ==
                                              ProductType.cigarettes) {
                                            _model.tap = null;
                                            safeSetState(() {});
                                          } else {
                                            _model.tap = ProductType.cigarettes;
                                            safeSetState(() {});
                                          }
                                        },
                                        child: Container(
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x2B202529),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 6.0, 10.0, 6.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                if (false)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                4.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/pizzaicon.png',
                                                        width: 16.0,
                                                        height: 16.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '5d269i3h' /* Сигареты */,
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: _model.tap ==
                                                                    ProductType
                                                                        .cigarettes
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.tap ==
                                              ProductType.freezing) {
                                            _model.tap = null;
                                            safeSetState(() {});
                                          } else {
                                            _model.tap = ProductType.freezing;
                                            safeSetState(() {});
                                          }
                                        },
                                        child: Container(
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x2B202529),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 6.0, 10.0, 6.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                if (false)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                4.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/pizzaicon.png',
                                                        width: 16.0,
                                                        height: 16.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'wex06w3h' /* Заморозка */,
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: _model.tap ==
                                                                    ProductType
                                                                        .freezing
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.tap ==
                                              ProductType.seafood) {
                                            _model.tap = null;
                                            safeSetState(() {});
                                          } else {
                                            _model.tap = ProductType.seafood;
                                            safeSetState(() {});
                                          }
                                        },
                                        child: Container(
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x2B202529),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 6.0, 10.0, 6.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                if (false)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                4.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/pizzaicon.png',
                                                        width: 16.0,
                                                        height: 16.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '1vo1vpft' /* Море прод. */,
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: _model.tap ==
                                                                    ProductType
                                                                        .seafood
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.tap ==
                                              ProductType.babyfood) {
                                            _model.tap = null;
                                            safeSetState(() {});
                                          } else {
                                            _model.tap = ProductType.babyfood;
                                            safeSetState(() {});
                                          }
                                        },
                                        child: Container(
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x2B202529),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 6.0, 10.0, 6.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                if (false)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                4.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/pizzaicon.png',
                                                        width: 16.0,
                                                        height: 16.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'epoqnmbt' /* Детское */,
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: _model.tap ==
                                                                    ProductType
                                                                        .babyfood
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.tap == ProductType.meat) {
                                            _model.tap = null;
                                            safeSetState(() {});
                                          } else {
                                            _model.tap = ProductType.meat;
                                            safeSetState(() {});
                                          }
                                        },
                                        child: Container(
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x2B202529),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 6.0, 10.0, 6.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                if (false)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                4.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/pizzaicon.png',
                                                        width: 16.0,
                                                        height: 16.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '9j3bxod8' /* Мясо */,
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: _model.tap ==
                                                                    ProductType
                                                                        .meat
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (false)
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (_model.tap ==
                                                ProductType.cigarettes) {
                                              _model.tap = null;
                                              safeSetState(() {});
                                            } else {
                                              _model.tap =
                                                  ProductType.cigarettes;
                                              safeSetState(() {});
                                            }
                                          },
                                          child: Container(
                                            height: 30.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x2B202529),
                                                  offset: Offset(
                                                    0.0,
                                                    2.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      6.0, 6.0, 10.0, 6.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  if (false)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  4.0,
                                                                  0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: Image.asset(
                                                          'assets/images/pizzaicon.png',
                                                          width: 16.0,
                                                          height: 16.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'nqi1kuay' /* Сигареты */,
                                                    ),
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              color: _model
                                                                          .tap ==
                                                                      ProductType
                                                                          .cigarettes
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (false)
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (_model.tap ==
                                                ProductType.cigarettes) {
                                              _model.tap = null;
                                              safeSetState(() {});
                                            } else {
                                              _model.tap =
                                                  ProductType.cigarettes;
                                              safeSetState(() {});
                                            }
                                          },
                                          child: Container(
                                            height: 30.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x2B202529),
                                                  offset: Offset(
                                                    0.0,
                                                    2.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      6.0, 6.0, 10.0, 6.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  if (false)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  4.0,
                                                                  0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: Image.asset(
                                                          'assets/images/pizzaicon.png',
                                                          width: 16.0,
                                                          height: 16.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'stoplflp' /* Сигареты */,
                                                    ),
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              color: _model
                                                                          .tap ==
                                                                      ProductType
                                                                          .cigarettes
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (false)
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (_model.tap ==
                                                ProductType.cigarettes) {
                                              _model.tap = null;
                                              safeSetState(() {});
                                            } else {
                                              _model.tap =
                                                  ProductType.cigarettes;
                                              safeSetState(() {});
                                            }
                                          },
                                          child: Container(
                                            height: 30.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x2B202529),
                                                  offset: Offset(
                                                    0.0,
                                                    2.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      6.0, 6.0, 10.0, 6.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  if (false)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  4.0,
                                                                  0.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: Image.asset(
                                                          'assets/images/pizzaicon.png',
                                                          width: 16.0,
                                                          height: 16.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '0rptgt09' /* Сигареты */,
                                                    ),
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              color: _model
                                                                          .tap ==
                                                                      ProductType
                                                                          .cigarettes
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.tap ==
                                              ProductType.dessert) {
                                            _model.tap = null;
                                            safeSetState(() {});
                                          } else {
                                            _model.tap = ProductType.dessert;
                                            safeSetState(() {});
                                          }
                                        },
                                        child: Container(
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x2B202529),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 6.0, 10.0, 6.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                if (false)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                4.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/pizzaicon.png',
                                                        width: 16.0,
                                                        height: 16.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'w4rtxn3b' /* Десерты */,
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: _model.tap ==
                                                                    ProductType
                                                                        .dessert
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.tap ==
                                              ProductType.dessert) {
                                            _model.tap = null;
                                            safeSetState(() {});
                                          } else {
                                            _model.tap = ProductType.dessert;
                                            safeSetState(() {});
                                          }
                                        },
                                        child: Container(
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x2B202529),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 6.0, 10.0, 6.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                if (false)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                4.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/pizzaicon.png',
                                                        width: 16.0,
                                                        height: 16.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '8evzfba1' /* Сладкое */,
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: _model.tap ==
                                                                    ProductType
                                                                        .dessert
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.tap ==
                                              ProductType.hardwarestore) {
                                            _model.tap = null;
                                            safeSetState(() {});
                                          } else {
                                            _model.tap =
                                                ProductType.hardwarestore;
                                            safeSetState(() {});
                                          }
                                        },
                                        child: Container(
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x2B202529),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 6.0, 10.0, 6.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                if (false)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                4.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/pizzaicon.png',
                                                        width: 16.0,
                                                        height: 16.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'xahqcoel' /* Хоз товар */,
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: _model.tap ==
                                                                    ProductType
                                                                        .hardwarestore
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.tap ==
                                              ProductType.others) {
                                            _model.tap = null;
                                            safeSetState(() {});
                                          } else {
                                            _model.tap = ProductType.others;
                                            safeSetState(() {});
                                          }
                                        },
                                        child: Container(
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x2B202529),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 6.0, 10.0, 6.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                if (false)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                4.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/pizzaicon.png',
                                                        width: 16.0,
                                                        height: 16.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '6x83o58t' /* Другие */,
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: _model.tap ==
                                                                    ProductType
                                                                        .others
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.allCategorical = false;
                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x2B202529),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 6.0, 10.0, 6.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                if (false)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                4.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/pizzaicon.png',
                                                        width: 16.0,
                                                        height: 16.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'gueo7iai' /* скрыть... */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  StreamBuilder<List<BanersRecord>>(
                    stream: queryBanersRecord(),
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
                      List<BanersRecord> rowBanersRecordList = snapshot.data!;

                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(rowBanersRecordList.length,
                                  (rowIndex) {
                            final rowBanersRecord =
                                rowBanersRecordList[rowIndex];
                            return Builder(
                              builder: (context) => InkWell(
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
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              1.0,
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          child: BannerItemWidget(
                                            url: rowBanersRecord.url,
                                            baner: rowBanersRecord.reference,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  width: 120.0,
                                  height: 160.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: Image.network(
                                        rowBanersRecord.url,
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
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
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 16.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'lwnk6ozr' /* Часто заказывают */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineLarge.override(
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
                      final offenOrderedList = wholeStorePagePizzaRecordList
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
                                    'documentProduct': serializeParam(
                                      offenOrderedListItem,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'documentProduct': offenOrderedListItem,
                                  },
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
                                    'Keyswx_${offenOrderedListIndex.toString()}',
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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: 200.0,
                                child: TextFormField(
                                  controller:
                                      _model.searchTextFieldTextController,
                                  focusNode: _model.searchTextFieldFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.searchTextFieldTextController',
                                    const Duration(milliseconds: 2000),
                                    () async {
                                      if (_model.searchTextFieldTextController
                                                  .text !=
                                              '') {
                                        await queryPizzaRecordOnce()
                                            .then(
                                              (records) => _model
                                                      .simpleSearchResults2 =
                                                  TextSearch(
                                                records
                                                    .map(
                                                      (record) => TextSearchItem
                                                          .fromTerms(record, [
                                                        record.name,
                                                        record.description,
                                                        record.barcode
                                                      ]),
                                                    )
                                                    .toList(),
                                              )
                                                      .search(_model
                                                          .searchTextFieldTextController
                                                          .text)
                                                      .map((r) => r.object)
                                                      .toList(),
                                            )
                                            .onError((_, __) => _model
                                                .simpleSearchResults2 = [])
                                            .whenComplete(
                                                () => safeSetState(() {}));

                                        _model.isSearchDoing = true;
                                        safeSetState(() {});
                                      } else {
                                        _model.isSearchDoing = false;
                                        safeSetState(() {});
                                      }
                                    },
                                  ),
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'wkshynz5' /* Поиск */,
                                    ),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    suffixIcon: _model
                                            .searchTextFieldTextController!
                                            .text
                                            .isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model
                                                  .searchTextFieldTextController
                                                  ?.clear();
                                              if (_model.searchTextFieldTextController
                                                          .text !=
                                                      '') {
                                                await queryPizzaRecordOnce()
                                                    .then(
                                                      (records) => _model
                                                              .simpleSearchResults2 =
                                                          TextSearch(
                                                        records
                                                            .map(
                                                              (record) =>
                                                                  TextSearchItem
                                                                      .fromTerms(
                                                                          record,
                                                                          [
                                                                    record
                                                                        .name,
                                                                    record
                                                                        .description,
                                                                    record
                                                                        .barcode
                                                                  ]),
                                                            )
                                                            .toList(),
                                                      )
                                                              .search(_model
                                                                  .searchTextFieldTextController
                                                                  .text)
                                                              .map((r) =>
                                                                  r.object)
                                                              .toList(),
                                                    )
                                                    .onError((_, __) => _model
                                                            .simpleSearchResults2 =
                                                        [])
                                                    .whenComplete(() =>
                                                        safeSetState(() {}));

                                                _model.isSearchDoing = true;
                                                safeSetState(() {});
                                              } else {
                                                _model.isSearchDoing = false;
                                                safeSetState(() {});
                                              }

                                              safeSetState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 24.0,
                                            ),
                                          )
                                        : null,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model
                                      .searchTextFieldTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if ((currentUserDocument?.userType ==
                              UserTypes.manager) ||
                          (currentUserDocument?.userType == UserTypes.admin))
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '9lccamso' /* Показать удаленые */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color:
                                            FlutterFlowTheme.of(context).error,
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
                                        FlutterFlowTheme.of(context).alternate,
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
                        ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final llistOfPizza = (_model.isSearchDoing
                                    ? _model.simpleSearchResults2
                                    : wholeStorePagePizzaRecordList)
                                .toList();

                            return ListView.separated(
                              padding: const EdgeInsets.fromLTRB(
                                0,
                                0,
                                0,
                                50.0,
                              ),
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: llistOfPizza.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 2.0),
                              itemBuilder: (context, llistOfPizzaIndex) {
                                final llistOfPizzaItem =
                                    llistOfPizza[llistOfPizzaIndex];
                                return Visibility(
                                  visible: llistOfPizzaItem.store ==
                                      widget.wholeStore,
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if ((llistOfPizzaItem.inStock == true) ||
                                          ((currentUserDocument?.userType ==
                                                  UserTypes.manager) ||
                                              (currentUserDocument?.userType ==
                                                  UserTypes.admin))) {
                                        context.pushNamed(
                                          'ProductDeckPage',
                                          queryParameters: {
                                            'documentProduct': serializeParam(
                                              llistOfPizzaItem,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'documentProduct': llistOfPizzaItem,
                                          },
                                        );
                                      }
                                    },
                                    child: wrapWithModel(
                                      model: _model.pizzaItemModels.getModel(
                                        llistOfPizzaIndex.toString(),
                                        llistOfPizzaIndex,
                                      ),
                                      updateCallback: () => safeSetState(() {}),
                                      child: PizzaItemWidget(
                                        key: Key(
                                          'Keyu2o_${llistOfPizzaIndex.toString()}',
                                        ),
                                        name: llistOfPizzaItem.name,
                                        deskription:
                                            llistOfPizzaItem.description,
                                        price: llistOfPizzaItem.price,
                                        image: llistOfPizzaItem.img,
                                        instock: llistOfPizzaItem.inStock,
                                        refproduct: llistOfPizzaItem.reference,
                                      ),
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
              if (FFAppState().cart.isNotEmpty)
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('CartPage');
                    },
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 46.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).colorLink,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 8.0, 0.0),
                                        child: Container(
                                          width: 20.0,
                                          height: 20.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              functions
                                                  .getSizeOfCartList(
                                                      FFAppState()
                                                          .cart
                                                          .toList())
                                                  .toString(),
                                              '1',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .colorLink,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '64vwyl00' /* В корзине */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w800,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        formatNumber(
                                          functions.summPizza(
                                              FFAppState().cart.toList()),
                                          formatType: FormatType.decimal,
                                          decimalType: DecimalType.automatic,
                                          currency: '₩',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w800,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
