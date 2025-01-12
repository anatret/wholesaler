import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'empty_cart_model.dart';
export 'empty_cart_model.dart';

class EmptyCartWidget extends StatefulWidget {
  const EmptyCartWidget({
    super.key,
    String? page,
  }) : page = page ?? 'cart';

  final String page;

  @override
  State<EmptyCartWidget> createState() => _EmptyCartWidgetState();
}

class _EmptyCartWidgetState extends State<EmptyCartWidget> {
  late EmptyCartModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyCartModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 200.0,
            height: 200.0,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: const Icon(
              Icons.shopping_cart,
              color: Color(0xFFBDBDBD),
              size: 80.0,
            ),
          ),
          Text(
            () {
              if (widget.page == 'cart') {
                return FFLocalizations.of(context).getVariableText(
                  ruText: 'Ваша корзина пуста',
                  enText: 'Your cart is empty',
                  koText: '장바구니가 비어있습니다',
                  zh_HansText: '您的购物车是空的',
                );
              } else if (widget.page == 'order') {
                return FFLocalizations.of(context).getVariableText(
                  ruText: 'Заказов нет',
                  enText: 'No orders',
                  koText: '주문 없음',
                  zh_HansText: '沒有訂單',
                );
              } else if (widget.page == 'favorit') {
                return FFLocalizations.of(context).getVariableText(
                  ruText: 'Список избранных пуст',
                  enText: 'Favorites list is empty',
                  koText: '즐겨찾기 목록이 비어 있습니다',
                  zh_HansText: '收藏夹列表为空',
                );
              } else if (widget.page == 'newOrder') {
                return FFLocalizations.of(context).getVariableText(
                  ruText: 'Новых заказов нет',
                  enText: 'There are no new orders',
                  koText: '새로운 주문이 없습니다',
                  zh_HansText: '没有新订单',
                );
              } else {
                return FFLocalizations.of(context).getVariableText(
                  ruText: 'Пусто',
                  enText: 'Empty',
                  koText: '비어 있는',
                  zh_HansText: '空的',
                );
              }
            }(),
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  letterSpacing: 0.0,
                ),
          ),
          Text(
            valueOrDefault<String>(
              () {
                if ((widget.page == 'cart') || (widget.page == 'order')) {
                  return 'Добавьте товары в корзину, чтобы оформить заказ';
                } else if (widget.page == 'favorit') {
                  return 'Добавьте сюда свои любимые товары!';
                } else {
                  return null;
                }
              }(),
              '-',
            ),
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  color: FlutterFlowTheme.of(context).secondaryText,
                  letterSpacing: 0.0,
                ),
          ),
          FFButtonWidget(
            onPressed: () async {
              if ((widget.page == 'cart') || (widget.page == 'favorit')) {
                context.pushNamed('HomePageWholeStore');
              } else if (widget.page == 'order') {
                context.goNamed('CartPage');
              } else if (widget.page == 'newOrder') {
                context.goNamed('ManagerOrderListPage');
              }
            },
            text: FFLocalizations.of(context).getText(
              'u82bmd2l' /* Перейти */,
            ),
            options: FFButtonOptions(
              width: 250.0,
              height: 50.0,
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Readex Pro',
                    color: FlutterFlowTheme.of(context).info,
                    letterSpacing: 0.0,
                  ),
              elevation: 0.0,
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ].divide(const SizedBox(height: 24.0)),
      ),
    );
  }
}
