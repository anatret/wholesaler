import '/backend/backend.dart';
import '/components/deckription_item/deckription_item_widget.dart';
import '/components/empty_cart/empty_cart_widget.dart';
import '/components/favorit_item/favorit_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
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
        preferredSize: const Size.fromHeight(58.0),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: const AlignmentDirectional(1.0, -1.0),
                      children: [
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 2.0, 5.0, 0.0),
                          child: Icon(
                            Icons.notifications_none,
                            color: Color(0xFF3C3C3C),
                            size: 24.0,
                          ),
                        ),
                        Container(
                          width: 16.0,
                          height: 16.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            shape: BoxShape.circle,
                          ),
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '2vnjcnbg' /* 3 */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 9.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ],
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
      body: ListView(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 16.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'jodiglg3' /* Избранное */,
              ),
              style: FlutterFlowTheme.of(context).headlineLarge.override(
                    fontFamily: 'Outfit',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Builder(
              builder: (context) {
                final favorits = FFAppState().favorits.toList();
                if (favorits.isEmpty) {
                  return const EmptyCartWidget(
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
                          decoration: const BoxDecoration(),
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
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.9,
                                      child: DeckriptionItemWidget(
                                        name: containerPizzaRecord.name,
                                        deskription:
                                            containerPizzaRecord.description,
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
                                deskription: containerPizzaRecord.description,
                                price: containerPizzaRecord.price,
                                image: containerPizzaRecord.img,
                                ref: containerPizzaRecord.reference,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).divide(const SizedBox(height: 16.0)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
