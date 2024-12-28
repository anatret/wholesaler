import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'addnew_store_model.dart';
export 'addnew_store_model.dart';

class AddnewStoreWidget extends StatefulWidget {
  const AddnewStoreWidget({
    super.key,
    this.data,
    bool? edit,
    this.indexoflist,
  }) : edit = edit ?? false;

  final AddressStruct? data;
  final bool edit;
  final int? indexoflist;

  @override
  State<AddnewStoreWidget> createState() => _AddnewStoreWidgetState();
}

class _AddnewStoreWidgetState extends State<AddnewStoreWidget> {
  late AddnewStoreModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddnewStoreModel());

    _model.sityFieldTextController ??=
        TextEditingController(text: widget.data?.city);
    _model.sityFieldFocusNode ??= FocusNode();

    _model.streetFieldTextController ??=
        TextEditingController(text: widget.data?.street);
    _model.streetFieldFocusNode ??= FocusNode();

    _model.homeFieldTextController ??=
        TextEditingController(text: widget.data?.building);
    _model.homeFieldFocusNode ??= FocusNode();

    _model.apartFieldTextController ??=
        TextEditingController(text: widget.data?.apart);
    _model.apartFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 4.0),
                child: Container(
                  width: 90.0,
                  height: 4.0,
                  decoration: const BoxDecoration(
                    color: Color(0xFFD0D0D0),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(1.0, -1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 18.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    color: Color(0xFFBABABA),
                    size: 24.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
              child: Text(
                widget.edit ? 'Изменить адрес' : 'Добавить новый адрес',
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Outfit',
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: SizedBox(
                width: double.infinity,
                child: TextFormField(
                  controller: _model.sityFieldTextController,
                  focusNode: _model.sityFieldFocusNode,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: true,
                    labelText: FFLocalizations.of(context).getText(
                      'ynhzuts8' /* Город */,
                    ),
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).accent4,
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFE7E7E7),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0.0,
                      ),
                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                  validator: _model.sityFieldTextControllerValidator
                      .asValidator(context),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: SizedBox(
                width: double.infinity,
                child: TextFormField(
                  controller: _model.streetFieldTextController,
                  focusNode: _model.streetFieldFocusNode,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: true,
                    labelText: FFLocalizations.of(context).getText(
                      'u4ekfihf' /* Улица */,
                    ),
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).accent4,
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFE7E7E7),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0.0,
                      ),
                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                  validator: _model.streetFieldTextControllerValidator
                      .asValidator(context),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: SizedBox(
                width: double.infinity,
                child: TextFormField(
                  controller: _model.homeFieldTextController,
                  focusNode: _model.homeFieldFocusNode,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: true,
                    labelText: FFLocalizations.of(context).getText(
                      'er69ssub' /* Дом */,
                    ),
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).accent4,
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFE7E7E7),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0.0,
                      ),
                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                  validator: _model.homeFieldTextControllerValidator
                      .asValidator(context),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: SizedBox(
                width: double.infinity,
                child: TextFormField(
                  controller: _model.apartFieldTextController,
                  focusNode: _model.apartFieldFocusNode,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: true,
                    labelText: FFLocalizations.of(context).getText(
                      '4v60pgzd' /* Квартира */,
                    ),
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).accent4,
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFE7E7E7),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0.0,
                      ),
                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                  validator: _model.apartFieldTextControllerValidator
                      .asValidator(context),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 88.0),
              child: FFButtonWidget(
                onPressed: () async {
                  if (widget.edit) {
                    await currentUserReference!.update({
                      ...mapToFirestore(
                        {
                          'addresses': FieldValue.arrayRemove([
                            getAddressFirestoreData(
                              updateAddressStruct(
                                widget.data,
                                clearUnsetFields: false,
                              ),
                              true,
                            )
                          ]),
                        },
                      ),
                    });

                    await currentUserReference!.update({
                      ...mapToFirestore(
                        {
                          'addresses': FieldValue.arrayUnion([
                            getAddressFirestoreData(
                              updateAddressStruct(
                                AddressStruct(
                                  city: _model.sityFieldTextController.text,
                                  street: _model.streetFieldTextController.text,
                                  building: _model.homeFieldTextController.text,
                                  apart: _model.apartFieldTextController.text,
                                ),
                                clearUnsetFields: false,
                              ),
                              true,
                            )
                          ]),
                        },
                      ),
                    });
                  } else {
                    await currentUserReference!.update({
                      ...mapToFirestore(
                        {
                          'addresses': FieldValue.arrayUnion([
                            getAddressFirestoreData(
                              updateAddressStruct(
                                AddressStruct(
                                  city: _model.sityFieldTextController.text,
                                  street: _model.streetFieldTextController.text,
                                  building: _model.homeFieldTextController.text,
                                  apart: _model.apartFieldTextController.text,
                                ),
                                clearUnsetFields: false,
                              ),
                              true,
                            )
                          ]),
                        },
                      ),
                    });
                  }

                  FFAppState().update(() {});
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        widget.edit
                            ? 'Адрес успешно изменен'
                            : 'Адрес успешно добавлен',
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ),
                      duration: const Duration(milliseconds: 2000),
                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                    ),
                  );
                },
                text: widget.edit ? 'Изменить' : 'Добавить адрес',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 48.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
            ),
          ],
        ),
      ),
    );
  }
}
