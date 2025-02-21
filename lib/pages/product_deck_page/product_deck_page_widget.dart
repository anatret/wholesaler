import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/add_to_cart_count/add_to_cart_count_widget.dart';
import '/components/fab/f_a_b_prod_edit_for_admin/f_a_b_prod_edit_for_admin_widget.dart';
import '/components/fab/f_a_b_whole_store_page/f_a_b_whole_store_page_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'product_deck_page_model.dart';
export 'product_deck_page_model.dart';

class ProductDeckPageWidget extends StatefulWidget {
  const ProductDeckPageWidget({
    super.key,
    this.productRef,
  });

  final DocumentReference? productRef;

  @override
  State<ProductDeckPageWidget> createState() => _ProductDeckPageWidgetState();
}

class _ProductDeckPageWidgetState extends State<ProductDeckPageWidget> {
  late ProductDeckPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductDeckPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    // On page dispose action.
    () async {
      FFAppState().isFabExpdProdPag = false;
      safeSetState(() {});
    }();

    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<PizzaRecord>(
      stream: PizzaRecord.getDocument(widget.productRef!),
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

        final productDeckPagePizzaRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(58.0),
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
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.safePop();
                          },
                          child: Container(
                            width: 36.0,
                            height: 36.0,
                            decoration: BoxDecoration(),
                            child: Icon(
                              Icons.arrow_back,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 26.0,
                            ),
                          ),
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
            body: StreamBuilder<StoresRecord>(
              stream:
                  StoresRecord.getDocument(productDeckPagePizzaRecord.store!),
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

                final stackStoresRecord = snapshot.data!;

                return Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 450.0,
                        ),
                        decoration: BoxDecoration(),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 300.0,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Image.network(
                                        productDeckPagePizzaRecord.img,
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 300.0,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 16.0, 16.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 48.0,
                                                height: 48.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                child: ToggleIcon(
                                                  onPressed: () async {
                                                    safeSetState(
                                                      () => FFAppState()
                                                              .favorits
                                                              .contains(widget
                                                                  .productRef)
                                                          ? FFAppState()
                                                              .removeFromFavorits(
                                                                  widget
                                                                      .productRef!)
                                                          : FFAppState()
                                                              .addToFavorits(widget
                                                                  .productRef!),
                                                    );
                                                  },
                                                  value: FFAppState()
                                                      .favorits
                                                      .contains(
                                                          widget.productRef),
                                                  onIcon: Icon(
                                                    Icons.favorite_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    size: 24.0,
                                                  ),
                                                  offIcon: Icon(
                                                    Icons.favorite_border,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 48.0,
                                                height: 48.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                  shape: BoxShape.rectangle,
                                                ),
                                                child: Builder(
                                                  builder: (context) => InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await Share.share(
                                                        'wholesaler://wholesaler.com${GoRouterState.of(context).uri.toString()}',
                                                        sharePositionOrigin:
                                                            getWidgetBoundingBox(
                                                                context),
                                                      );
                                                    },
                                                    child: Icon(
                                                      Icons.share_outlined,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 4.0)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(32.0),
                                    topRight: Radius.circular(32.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 12.0, 24.0, 24.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '${formatNumber(
                                                      productDeckPagePizzaRecord
                                                          .price,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType:
                                                          DecimalType.automatic,
                                                      currency: '₩ ',
                                                    )}',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Text(
                                            productDeckPagePizzaRecord.name,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              productDeckPagePizzaRecord
                                                  .productType?.name,
                                              'Категория продукта',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: Text(
                                              productDeckPagePizzaRecord
                                                  .description,
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                          if (productDeckPagePizzaRecord
                                              .itsCoupang)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await launchURL(
                                                      productDeckPagePizzaRecord
                                                          .linkToProduct);
                                                },
                                                child: Text(
                                                  productDeckPagePizzaRecord
                                                      .linkToProduct,
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .colorLink,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                      if (false)
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF3F3F3),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 16.0, 16.0, 16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '4ogbz3li' /* Select Size */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                FlutterFlowChoiceChips(
                                                  options: [
                                                    ChipData(FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      '09ccqk6c' /* S */,
                                                    )),
                                                    ChipData(FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'yu9zox1h' /* M */,
                                                    )),
                                                    ChipData(FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'oma2xj2l' /* L */,
                                                    )),
                                                    ChipData(FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'jcvzc53k' /* XL */,
                                                    ))
                                                  ],
                                                  onChanged: (val) =>
                                                      safeSetState(() => _model
                                                              .choiceChipsValue1 =
                                                          val?.firstOrNull),
                                                  selectedChipStyle: ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 18.0,
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  unselectedChipStyle:
                                                      ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 18.0,
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  chipSpacing: 8.0,
                                                  rowSpacing: 8.0,
                                                  multiselect: false,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  controller: _model
                                                          .choiceChipsValueController1 ??=
                                                      FormFieldController<
                                                          List<String>>(
                                                    [],
                                                  ),
                                                  wrapped: true,
                                                ),
                                              ].divide(SizedBox(height: 12.0)),
                                            ),
                                          ),
                                        ),
                                      if (false)
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF3F3F3),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 16.0, 16.0, 16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '4g67fyar' /* Select Color */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                FlutterFlowChoiceChips(
                                                  options: [
                                                    ChipData(FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'hswd8ivr' /* Black */,
                                                    )),
                                                    ChipData(FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'e2g07pl7' /* White */,
                                                    )),
                                                    ChipData(FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'qpnyj3et' /* Red */,
                                                    )),
                                                    ChipData(FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'sq8t9rb8' /* Blue */,
                                                    ))
                                                  ],
                                                  onChanged: (val) =>
                                                      safeSetState(() => _model
                                                              .choiceChipsValue2 =
                                                          val?.firstOrNull),
                                                  selectedChipStyle: ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 18.0,
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  unselectedChipStyle:
                                                      ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 18.0,
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  chipSpacing: 8.0,
                                                  rowSpacing: 8.0,
                                                  multiselect: false,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  controller: _model
                                                          .choiceChipsValueController2 ??=
                                                      FormFieldController<
                                                          List<String>>(
                                                    [],
                                                  ),
                                                  wrapped: true,
                                                ),
                                              ].divide(SizedBox(height: 12.0)),
                                            ),
                                          ),
                                        ),
                                    ].divide(SizedBox(height: 20.0)),
                                  ),
                                ),
                              ),
                            ].addToEnd(SizedBox(height: 100.0)),
                          ),
                        ),
                      ),
                    ),
                    if (!productDeckPagePizzaRecord.itsCoupang)
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: Container(
                            height: 80.0,
                            constraints: BoxConstraints(
                              maxWidth: 450.0,
                            ),
                            decoration: BoxDecoration(),
                            child: Visibility(
                              visible: (currentUserDocument?.userType ==
                                      UserTypes.user) ||
                                  (currentUserDocument?.userType ==
                                      UserTypes.admin),
                              child: AuthUserStreamWidget(
                                builder: (context) => Builder(
                                  builder: (context) {
                                    if (!functions.checkCart(
                                        FFAppState()
                                            .cart
                                            .map((e) => e.pizza)
                                            .withoutNulls
                                            .toList(),
                                        widget.productRef!)) {
                                      return Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            if (false)
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  if (FFAppState()
                                                          .wholeSalerinCart ==
                                                      null) {
                                                    FFAppState()
                                                        .addToCart(CartStruct(
                                                      pizza: widget.productRef,
                                                      price:
                                                          productDeckPagePizzaRecord
                                                              .price,
                                                      count: 1,
                                                    ));
                                                    FFAppState()
                                                            .wholeSalerinCart =
                                                        productDeckPagePizzaRecord
                                                            .store;
                                                    safeSetState(() {});
                                                  } else if ((FFAppState()
                                                              .wholeSalerinCart !=
                                                          null) &&
                                                      (FFAppState()
                                                              .wholeSalerinCart ==
                                                          productDeckPagePizzaRecord
                                                              .store)) {
                                                    FFAppState()
                                                        .addToCart(CartStruct(
                                                      pizza: widget.productRef,
                                                      price:
                                                          productDeckPagePizzaRecord
                                                              .price,
                                                      count: 1,
                                                    ));
                                                    safeSetState(() {});
                                                  } else {
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'Ошибка добавления'),
                                                                  content: Text(
                                                                      'В корзине уже находятся товары от другого поставщика. Пожалуйста, завершите оформление текущего заказа или очистите корзину, чтобы добавить новый товар.'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                      child: Text(
                                                                          'Отмена'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                      child: Text(
                                                                          'Очистить и добавить '),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (confirmDialogResponse) {
                                                      FFAppState().cart = [];
                                                      FFAppState()
                                                              .wholeSalerinCart =
                                                          null;
                                                      safeSetState(() {});
                                                      FFAppState()
                                                          .addToCart(CartStruct(
                                                        pizza:
                                                            widget.productRef,
                                                        price:
                                                            productDeckPagePizzaRecord
                                                                .price,
                                                        count: 1,
                                                      ));
                                                      FFAppState()
                                                              .wholeSalerinCart =
                                                          productDeckPagePizzaRecord
                                                              .store;
                                                      safeSetState(() {});
                                                    } else {
                                                      return;
                                                    }
                                                  }

                                                  Navigator.pop(context);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Товар добавлен в корзину',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 1500),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  );
                                                },
                                                text:
                                                    'Добавить в корзину за ${productDeckPagePizzaRecord.price.toString()} ₩',
                                                options: FFButtonOptions(
                                                  width: 24.0,
                                                  height: 24.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                ),
                                              ),
                                            wrapWithModel(
                                              model: _model.addToCartCountModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: AddToCartCountWidget(
                                                prodDoc:
                                                    productDeckPagePizzaRecord,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      return Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'u3qxtluf' /* Продукт уже есть в вашей корзи... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    if ((currentUserDocument?.userType == UserTypes.manager) ||
                        (currentUserDocument?.userType == UserTypes.admin))
                      Align(
                        alignment: AlignmentDirectional(1.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 80.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => wrapWithModel(
                              model: _model.fABProdEditForAdminModel,
                              updateCallback: () => safeSetState(() {}),
                              child: FABProdEditForAdminWidget(
                                prodRef: widget.productRef!,
                              ),
                            ),
                          ),
                        ),
                      ),
                    if ((currentUserDocument?.userType == UserTypes.user) &&
                        !productDeckPagePizzaRecord.itsCoupang)
                      Align(
                        alignment: AlignmentDirectional(1.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 80.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => wrapWithModel(
                              model: _model.fABWholeStorePageModel,
                              updateCallback: () => safeSetState(() {}),
                              child: FABWholeStorePageWidget(
                                wholeStore: stackStoresRecord.reference,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
