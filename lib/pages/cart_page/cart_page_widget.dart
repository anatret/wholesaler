import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/cart_item/cart_item_widget.dart';
import '/components/deckription_item/deckription_item_widget.dart';
import '/components/empty_cart/empty_cart_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'cart_page_model.dart';
export 'cart_page_model.dart';

class CartPageWidget extends StatefulWidget {
  const CartPageWidget({super.key});

  @override
  State<CartPageWidget> createState() => _CartPageWidgetState();
}

class _CartPageWidgetState extends State<CartPageWidget> {
  late CartPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartPageModel());

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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        floatingActionButton: Visibility(
          visible: FFAppState().cart.length >= 1,
          child: Align(
            alignment: AlignmentDirectional(1.0, 1.0),
            child: FloatingActionButton.extended(
              onPressed: () async {
                context.pushNamed(
                  'OrderPage',
                  extra: <String, dynamic>{
                    kTransitionInfoKey: TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.scale,
                      alignment: Alignment.bottomCenter,
                    ),
                  },
                );
              },
              backgroundColor: FlutterFlowTheme.of(context).primary,
              icon: Icon(
                Icons.border_color,
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              elevation: 8.0,
              label: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'os3sweqk' /* Оформить заказ */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    formatNumber(
                      functions.summPizza(FFAppState().cart.toList()),
                      formatType: FormatType.decimal,
                      decimalType: DecimalType.automatic,
                      currency: '₩',
                    ),
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Outfit',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ].divide(SizedBox(width: 8.0)),
              ),
            ),
          ),
        ),
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
                    Text(
                      FFLocalizations.of(context).getText(
                        'xxfbssnu' /* Корзина */,
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                        transitionType:
                                            PageTransitionType.scale,
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
                                        (badgeCount - containerCount)
                                            .toString(),
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
                                  animationType:
                                      badges.BadgeAnimationType.scale,
                                  toAnimate: true,
                                  child: Icon(
                                    Icons.notifications_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
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
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 450.0,
              ),
              decoration: BoxDecoration(),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: ListView(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    0,
                    0,
                    20.0,
                  ),
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final cart = FFAppState().cart.toList();
                          if (cart.isEmpty) {
                            return Center(
                              child: EmptyCartWidget(
                                page: 'cart',
                              ),
                            );
                          }

                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: List.generate(cart.length, (cartIndex) {
                              final cartItem = cart[cartIndex];
                              return Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: StreamBuilder<PizzaRecord>(
                                  stream:
                                      PizzaRecord.getDocument(cartItem.pizza!),
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
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }

                                    final cartItemPizzaRecord = snapshot.data!;

                                    return InkWell(
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
                                            return GestureDetector(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.9,
                                                  child: DeckriptionItemWidget(
                                                    name: cartItemPizzaRecord
                                                        .name,
                                                    deskription:
                                                        cartItemPizzaRecord
                                                            .description,
                                                    price: cartItemPizzaRecord
                                                        .price,
                                                    image:
                                                        cartItemPizzaRecord.img,
                                                    ref: cartItemPizzaRecord
                                                        .reference,
                                                    document:
                                                        cartItemPizzaRecord,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: wrapWithModel(
                                        model: _model.cartItemModels.getModel(
                                          cartIndex.toString(),
                                          cartIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: CartItemWidget(
                                          key: Key(
                                            'Key40b_${cartIndex.toString()}',
                                          ),
                                          name: cartItemPizzaRecord.name,
                                          deskription:
                                              cartItemPizzaRecord.description,
                                          price: cartItemPizzaRecord.price,
                                          image: cartItemPizzaRecord.img,
                                          cartItem: cartItem,
                                          index: cartIndex,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }).addToEnd(SizedBox(height: 30.0)),
                          );
                        },
                      ),
                    ),
                    if (false)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 40.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '6pmu4v6v' /* Сумма:  */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Text(
                              formatNumber(
                                functions.summPizza(FFAppState().cart.toList()),
                                formatType: FormatType.decimal,
                                decimalType: DecimalType.automatic,
                                currency: '₩',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF3C3C3C),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    if (false)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('OrderPage');
                          },
                          text: FFLocalizations.of(context).getText(
                            'l0sj2axs' /* Перейти к оформлению */,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 48.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
