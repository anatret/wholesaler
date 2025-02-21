import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'saobcha_item_model.dart';
export 'saobcha_item_model.dart';

class SaobchaItemWidget extends StatefulWidget {
  const SaobchaItemWidget({
    super.key,
    required this.url,
  });

  final String? url;

  @override
  State<SaobchaItemWidget> createState() => _SaobchaItemWidgetState();
}

class _SaobchaItemWidgetState extends State<SaobchaItemWidget> {
  late SaobchaItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SaobchaItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                widget.url!,
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 0.8,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FlutterFlowIconButton(
                borderRadius: 0.0,
                borderWidth: 0.0,
                buttonSize: 48.0,
                icon: Icon(
                  Icons.close,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 30.0,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
