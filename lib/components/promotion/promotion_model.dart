import '/flutter_flow/flutter_flow_util.dart';
import 'promotion_widget.dart' show PromotionWidget;
import 'package:flutter/material.dart';

class PromotionModel extends FlutterFlowModel<PromotionWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
