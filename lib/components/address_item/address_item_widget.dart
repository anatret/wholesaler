import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'address_item_model.dart';
export 'address_item_model.dart';

class AddressItemWidget extends StatefulWidget {
  const AddressItemWidget({
    super.key,
    required this.city,
    required this.street,
    required this.building,
    required this.apart,
    bool? isedit,
  }) : isedit = isedit ?? false;

  final String? city;
  final String? street;
  final String? building;
  final String? apart;
  final bool isedit;

  @override
  State<AddressItemWidget> createState() => _AddressItemWidgetState();
}

class _AddressItemWidgetState extends State<AddressItemWidget> {
  late AddressItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddressItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
          child: Icon(
            Icons.map_outlined,
            color: FlutterFlowTheme.of(context).primary,
            size: 16.0,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.city}, ${widget.street} ${widget.building}',
              style: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Readex Pro',
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Text(
              'улица ${widget.street}${widget.building}${widget.apart != null && widget.apart != '' ? ', ' : ' '}${widget.apart != null && widget.apart != '' ? 'квартира ' : ' '}${widget.apart != null && widget.apart != '' ? widget.apart : ' '}',
              style: FlutterFlowTheme.of(context).labelSmall.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0.0,
                  ),
            ),
            if (widget.isedit)
              Text(
                FFLocalizations.of(context).getText(
                  'uyw3cn0r' /* Изменить */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).primary,
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                    ),
              ),
          ].divide(const SizedBox(height: 6.0)),
        ),
      ],
    );
  }
}
