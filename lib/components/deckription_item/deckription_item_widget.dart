import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'deckription_item_model.dart';
export 'deckription_item_model.dart';

class DeckriptionItemWidget extends StatefulWidget {
  const DeckriptionItemWidget({
    super.key,
    required this.name,
    required this.deskription,
    required this.price,
    required this.image,
    required this.ref,
    required this.document,
  });

  final String? name;
  final String? deskription;
  final int? price;
  final String? image;
  final DocumentReference? ref;
  final PizzaRecord? document;

  @override
  State<DeckriptionItemWidget> createState() => _DeckriptionItemWidgetState();
}

class _DeckriptionItemWidgetState extends State<DeckriptionItemWidget> {
  late DeckriptionItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeckriptionItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if ((currentUserDocument?.userType == UserTypes.manager) ||
                        (currentUserDocument?.userType == UserTypes.admin))
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 20.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => StreamBuilder<PizzaRecord>(
                              stream: PizzaRecord.getDocument(widget.ref!),
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

                                final textPizzaRecord = snapshot.data!;

                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'AddProduct',
                                      queryParameters: {
                                        'isEdit': serializeParam(
                                          true,
                                          ParamType.bool,
                                        ),
                                        'productRef': serializeParam(
                                          widget.ref,
                                          ParamType.DocumentReference,
                                        ),
                                        'pizzaDoc': serializeParam(
                                          textPizzaRecord,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'pizzaDoc': textPizzaRecord,
                                      },
                                    );
                                  },
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'sqaxzhgu' /* Редактировать */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 24.0, 0.0, 24.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.network(
                            widget.image!,
                            width: 208.0,
                            height: 208.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    if (false)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: Container(
                          height: 40.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.productSize = Productsize.small;
                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: _model.productSize ==
                                                Productsize.small
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : const Color(0x00000000),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'ihxjp0q9' /* Маленькая */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: _model.productSize ==
                                                        Productsize.small
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.productSize = Productsize.medium;
                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: _model.productSize ==
                                                Productsize.medium
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : const Color(0x00000000),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '57b66eyg' /* Средняя */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: _model.productSize ==
                                                        Productsize.medium
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.productSize = Productsize.large;
                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: _model.productSize ==
                                                Productsize.large
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : const Color(0x00000000),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'pu204amo' /* Большая */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: _model.productSize ==
                                                        Productsize.large
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (false)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                        child: Container(
                          height: 40.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.isThin = false;
                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: _model.isThin != true
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : const Color(0x00000000),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'a7i96tsd' /* Традиционнае */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: _model.isThin != true
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.isThin = true;
                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: _model.isThin == true
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : const Color(0x00000000),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'rl1c267q' /* Тонкае */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: _model.isThin == true
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.name,
                          '-',
                        ),
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.deskription,
                            '-',
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),

                    // При необходимости вернуть и доделать урок 15
                    if (false)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'gnuiny1r' /* Добавить ингридиенты */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    if (false)
                      Expanded(
                        child: MasonryGridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 8.0,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return [
                              () => Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/vetchina.png',
                                          width: 80.0,
                                          height: 80.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 4.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'dhgotvh4' /* Ветчина из
цыпленка */
                                            ,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '27muwlil' /* + 350 */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                              () => Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/mocarela.png',
                                          width: 80.0,
                                          height: 80.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 4.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'j0wc25sy' /* Моцарелла */,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'yd8mxwbh' /* + 350 */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                              () => Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/shampinoni.png',
                                          width: 80.0,
                                          height: 80.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 4.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'fpqgfbc7' /* Шампиньоны */,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'ld0er7cp' /* + 350 */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                              () => Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/maslini.png',
                                          width: 80.0,
                                          height: 80.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 4.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'zld1njsc' /* Ветчина из
цыпленка */
                                            ,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'alnhzgtw' /* + 350 */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                              () => Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/ciplenok.png',
                                          width: 80.0,
                                          height: 80.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 4.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'jaga849t' /* Ветчина из
цыпленка */
                                            ,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'tll7niam' /* + 350 */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                              () => Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/sladkiyperec.png',
                                          width: 80.0,
                                          height: 80.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 4.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'ms7asp9f' /* Ветчина из
цыпленка */
                                            ,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '2pk53utc' /* + 350 */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                            ][index]();
                          },
                        ),
                      ),
                    Builder(
                      builder: (context) {
                        if (!functions.checkCart(
                            FFAppState()
                                .cart
                                .map((e) => e.pizza)
                                .withoutNulls
                                .toList(),
                            widget.ref!)) {
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                FFAppState().addToCart(CartStruct(
                                  pizza: widget.ref,
                                  price: widget.price,
                                  count: 1,
                                ));
                                safeSetState(() {});
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Пицца добавлена в корзину',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    duration: const Duration(milliseconds: 2400),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              },
                              text:
                                  'Добавить в корзину за ${valueOrDefault<String>(
                                widget.price?.toString(),
                                '0',
                              )} ₩',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 48.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
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
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          );
                        } else {
                          return Align(
                            alignment: const AlignmentDirectional(0.0, -1.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'wfdq730d' /* Продукт уже есть в вашей корзи... */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ToggleIcon(
                  onPressed: () async {
                    safeSetState(
                      () => FFAppState().favorits.contains(widget.ref)
                          ? FFAppState().removeFromFavorits(widget.ref!)
                          : FFAppState().addToFavorits(widget.ref!),
                    );
                  },
                  value: FFAppState().favorits.contains(widget.ref),
                  onIcon: Icon(
                    Icons.favorite_sharp,
                    color: FlutterFlowTheme.of(context).error,
                    size: 36.0,
                  ),
                  offIcon: Icon(
                    Icons.favorite_border,
                    color: FlutterFlowTheme.of(context).error,
                    size: 36.0,
                  ),
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 0.0,
                  borderWidth: 0.0,
                  buttonSize: 56.0,
                  icon: Icon(
                    Icons.close,
                    color: FlutterFlowTheme.of(context).accent4,
                    size: 36.0,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
