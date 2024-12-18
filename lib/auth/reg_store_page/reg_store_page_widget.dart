import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'reg_store_page_model.dart';
export 'reg_store_page_model.dart';

class RegStorePageWidget extends StatefulWidget {
  const RegStorePageWidget({super.key});

  @override
  State<RegStorePageWidget> createState() => _RegStorePageWidgetState();
}

class _RegStorePageWidgetState extends State<RegStorePageWidget> {
  late RegStorePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegStorePageModel());

    _model.nameFieldFocusNode ??= FocusNode();

    _model.phoneFieldFocusNode ??= FocusNode();

    _model.addressStoreFocusNode ??= FocusNode();

    _model.roomStoreFocusNode ??= FocusNode();

    _model.saobchaFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(58.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            title: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                                'h20ucvrm' /* 3 */,
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
                ],
              ),
            ),
            actions: const [],
            centerTitle: false,
            toolbarHeight: 58.0,
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: FutureBuilder<List<StoresRecord>>(
              future: (_model.firestoreRequestCompleter ??=
                      Completer<List<StoresRecord>>()
                        ..complete(queryStoresRecordOnce(
                          queryBuilder: (storesRecord) => storesRecord.where(
                            'user',
                            isEqualTo: currentUserReference,
                          ),
                          singleRecord: true,
                        )))
                  .future,
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
                List<StoresRecord> listViewStoresRecordList = snapshot.data!;
                final listViewStoresRecord = listViewStoresRecordList.isNotEmpty
                    ? listViewStoresRecordList.first
                    : null;

                return RefreshIndicator(
                  onRefresh: () async {
                    safeSetState(() => _model.firestoreRequestCompleter = null);
                    await _model.waitForFirestoreRequestCompleted();
                  },
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(
                      0,
                      0,
                      0,
                      32.0,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              listViewStoresRecord!.storeIsVerified
                                  ? 'Проверка пройдена'
                                  : 'Магазин на проверке',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: listViewStoresRecord.storeIsVerified
                                        ? FlutterFlowTheme.of(context).success
                                        : FlutterFlowTheme.of(context).error,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 40.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              // ActionStoreLogo
                              final selectedMedia =
                                  await selectMediaWithSourceBottomSheet(
                                context: context,
                                maxWidth: 131.00,
                                maxHeight: 120.00,
                                imageQuality: 52,
                                allowPhoto: true,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                safeSetState(
                                    () => _model.isDataUploading1 = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                var downloadUrls = <String>[];
                                try {
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                          ))
                                      .toList();

                                  downloadUrls = (await Future.wait(
                                    selectedMedia.map(
                                      (m) async => await uploadData(
                                          m.storagePath, m.bytes),
                                    ),
                                  ))
                                      .where((u) => u != null)
                                      .map((u) => u!)
                                      .toList();
                                } finally {
                                  _model.isDataUploading1 = false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedMedia.length &&
                                    downloadUrls.length ==
                                        selectedMedia.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile1 =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl1 =
                                        downloadUrls.first;
                                  });
                                } else {
                                  safeSetState(() {});
                                  return;
                                }
                              }
                            },
                            child: SizedBox(
                              width: 142.0,
                              height: 120.0,
                              child: Stack(
                                children: [
                                  Builder(
                                    builder: (context) {
                                      if ((_model.uploadedFileUrl1 != '') ||
                                          (listViewStoresRecord.logoImg !=
                                                  '')) {
                                        return Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, -1.0),
                                          child: Container(
                                            width: 120.0,
                                            height: 120.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              _model.uploadedFileUrl1 !=
                                                          ''
                                                  ? _model.uploadedFileUrl1
                                                  : listViewStoresRecord
                                                      .logoImg,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Container(
                                          width: 120.0,
                                          height: 120.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/Group_110.png',
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(1.0, 1.0),
                                    child: Container(
                                      width: 34.0,
                                      height: 34.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Icon(
                                        Icons.edit,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 15.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: TextFormField(
                          controller: _model.nameFieldTextController ??=
                              TextEditingController(
                            text: (listViewStoresRecord != null) == true
                                ? listViewStoresRecord.storeName
                                : null,
                          ),
                          focusNode: _model.nameFieldFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.nameFieldTextController',
                            const Duration(milliseconds: 2000),
                            () => safeSetState(() {}),
                          ),
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: FFLocalizations.of(context).getText(
                              'k0zdqdbm' /* Имя магазина */,
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
                                  color: FlutterFlowTheme.of(context).accent4,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
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
                            prefixIcon: Icon(
                              Icons.storefront_sharp,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 16.0,
                            ),
                            suffixIcon: _model
                                    .nameFieldTextController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.nameFieldTextController?.clear();
                                      safeSetState(() {});
                                    },
                                    child: const Icon(
                                      Icons.clear,
                                      color: Color(0xFF757575),
                                      size: 16.0,
                                    ),
                                  )
                                : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                          maxLength: 50,
                          validator: _model.nameFieldTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => TextFormField(
                            controller: _model.phoneFieldTextController ??=
                                TextEditingController(
                              text: (listViewStoresRecord != null) == true
                                  ? listViewStoresRecord.phone
                                  : currentPhoneNumber,
                            ),
                            focusNode: _model.phoneFieldFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.phoneFieldTextController',
                              const Duration(milliseconds: 2000),
                              () => safeSetState(() {}),
                            ),
                            autofocus: true,
                            textCapitalization: TextCapitalization.none,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                'e3rxd788' /* Телефон */,
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
                                    color: FlutterFlowTheme.of(context).accent4,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
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
                              prefixIcon: Icon(
                                Icons.local_phone_outlined,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 16.0,
                              ),
                              suffixIcon: _model
                                      .phoneFieldTextController!.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        _model.phoneFieldTextController
                                            ?.clear();
                                        safeSetState(() {});
                                      },
                                      child: const Icon(
                                        Icons.clear,
                                        color: Color(0xFF757575),
                                        size: 16.0,
                                      ),
                                    )
                                  : null,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                            keyboardType: TextInputType.phone,
                            validator: _model.phoneFieldTextControllerValidator
                                .asValidator(context),
                            inputFormatters: [_model.phoneFieldMask],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: TextFormField(
                          controller: _model.addressStoreTextController ??=
                              TextEditingController(
                            text: (listViewStoresRecord != null) == true
                                ? listViewStoresRecord.address
                                : null,
                          ),
                          focusNode: _model.addressStoreFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.addressStoreTextController',
                            const Duration(milliseconds: 2000),
                            () => safeSetState(() {}),
                          ),
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: FFLocalizations.of(context).getText(
                              '746a3s6z' /* Адрес */,
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
                                  color: FlutterFlowTheme.of(context).accent4,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
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
                            prefixIcon: Icon(
                              Icons.location_on_outlined,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 16.0,
                            ),
                            suffixIcon: _model
                                    .addressStoreTextController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.addressStoreTextController
                                          ?.clear();
                                      safeSetState(() {});
                                    },
                                    child: const Icon(
                                      Icons.clear,
                                      color: Color(0xFF757575),
                                      size: 16.0,
                                    ),
                                  )
                                : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                          validator: _model.addressStoreTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: TextFormField(
                          controller: _model.roomStoreTextController ??=
                              TextEditingController(
                            text: (listViewStoresRecord != null) == true
                                ? listViewStoresRecord.room
                                : null,
                          ),
                          focusNode: _model.roomStoreFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.roomStoreTextController',
                            const Duration(milliseconds: 2000),
                            () => safeSetState(() {}),
                          ),
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: FFLocalizations.of(context).getText(
                              '2c3nkl8s' /* Квартира */,
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
                                  color: FlutterFlowTheme.of(context).accent4,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
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
                            prefixIcon: Icon(
                              Icons.meeting_room,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 16.0,
                            ),
                            suffixIcon: _model
                                    .roomStoreTextController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.roomStoreTextController?.clear();
                                      safeSetState(() {});
                                    },
                                    child: const Icon(
                                      Icons.clear,
                                      color: Color(0xFF757575),
                                      size: 16.0,
                                    ),
                                  )
                                : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                          validator: _model.roomStoreTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: TextFormField(
                          controller: _model.saobchaTextController ??=
                              TextEditingController(
                            text: (listViewStoresRecord != null) == true
                                ? listViewStoresRecord.saobcha
                                : null,
                          ),
                          focusNode: _model.saobchaFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.saobchaTextController',
                            const Duration(milliseconds: 2000),
                            () => safeSetState(() {}),
                          ),
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: FFLocalizations.of(context).getText(
                              'jjzngdsn' /* САОБЧА */,
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
                                  color: FlutterFlowTheme.of(context).accent4,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
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
                            prefixIcon: Icon(
                              Icons.edit_document,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 16.0,
                            ),
                            suffixIcon:
                                _model.saobchaTextController!.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.saobchaTextController?.clear();
                                          safeSetState(() {});
                                        },
                                        child: const Icon(
                                          Icons.clear,
                                          color: Color(0xFF757575),
                                          size: 16.0,
                                        ),
                                      )
                                    : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                          validator: _model.saobchaTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 16.0, 0.0),
                              child: Container(
                                width: 180.0,
                                height: 180.0,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF3F3F3),
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: Image.network(
                                      _model.uploadedFileUrl2 != ''
                                          ? _model.uploadedFileUrl2
                                          : listViewStoresRecord.saobchaImg,
                                    ).image,
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'yuugvyux' /* загрузите */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'k83lppxf' /* фото акции */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'jcnrwec5' /* Формат: JPG, PNG */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    // ActionLoadSaobcha
                                    final selectedMedia = await selectMedia(
                                      maxWidth: 512.00,
                                      maxHeight: 512.00,
                                      imageQuality: 100,
                                      mediaSource: MediaSource.photoGallery,
                                      multiImage: false,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      safeSetState(
                                          () => _model.isDataUploading2 = true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];

                                      var downloadUrls = <String>[];
                                      try {
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                ))
                                            .toList();

                                        downloadUrls = (await Future.wait(
                                          selectedMedia.map(
                                            (m) async => await uploadData(
                                                m.storagePath, m.bytes),
                                          ),
                                        ))
                                            .where((u) => u != null)
                                            .map((u) => u!)
                                            .toList();
                                      } finally {
                                        _model.isDataUploading2 = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        safeSetState(() {
                                          _model.uploadedLocalFile2 =
                                              selectedUploadedFiles.first;
                                          _model.uploadedFileUrl2 =
                                              downloadUrls.first;
                                        });
                                      } else {
                                        safeSetState(() {});
                                        return;
                                      }
                                    }
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '3ln56ul1' /* Изменить фото */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 140.0,
                                    height: 34.0,
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
                              ].divide(const SizedBox(height: 4.0)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if ((listViewStoresRecord != null) == true) {
                              await listViewStoresRecord.reference
                                  .update(createStoresRecordData(
                                storeName: _model.nameFieldTextController.text,
                                address: _model.addressStoreTextController.text,
                                phone: _model.phoneFieldTextController.text,
                                room: _model.roomStoreTextController.text,
                                saobcha: _model.saobchaTextController.text,
                                logoImg: _model.uploadedFileUrl1 != ''
                                    ? _model.uploadedFileUrl1
                                    : listViewStoresRecord.logoImg,
                                saobchaImg: _model.uploadedFileUrl2 != ''
                                    ? _model.uploadedFileUrl2
                                    : listViewStoresRecord.saobchaImg,
                              ));
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: const Text('Изменение магазина'),
                                    content: const Text('Изменения сохранены'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: const Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              var storesRecordReference =
                                  StoresRecord.collection.doc();
                              await storesRecordReference
                                  .set(createStoresRecordData(
                                storeName: _model.nameFieldTextController.text,
                                user: currentUserReference,
                                address: _model.addressStoreTextController.text,
                                phone: _model.phoneFieldTextController.text,
                                room: _model.roomStoreTextController.text,
                                itsCoupang: false,
                                saobcha: _model.saobchaTextController.text,
                                logoImg: _model.uploadedFileUrl1,
                                saobchaImg: _model.uploadedFileUrl2,
                                storeIsVerified: false,
                              ));
                              _model.newStoreID =
                                  StoresRecord.getDocumentFromData(
                                      createStoresRecordData(
                                        storeName:
                                            _model.nameFieldTextController.text,
                                        user: currentUserReference,
                                        address: _model
                                            .addressStoreTextController.text,
                                        phone: _model
                                            .phoneFieldTextController.text,
                                        room:
                                            _model.roomStoreTextController.text,
                                        itsCoupang: false,
                                        saobcha:
                                            _model.saobchaTextController.text,
                                        logoImg: _model.uploadedFileUrl1,
                                        saobchaImg: _model.uploadedFileUrl2,
                                        storeIsVerified: false,
                                      ),
                                      storesRecordReference);

                              await currentUserReference!
                                  .update(createUserRecordData(
                                store: _model.newStoreID?.reference,
                              ));
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: const Text('Создавние магазина'),
                                    content: const Text('Магазин создан'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: const Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }

                            context.goNamed('Profile');

                            safeSetState(() {});
                          },
                          text: (listViewStoresRecord != null) == true
                              ? 'Изменить'
                              : 'Зарегистрироваться',
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
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
