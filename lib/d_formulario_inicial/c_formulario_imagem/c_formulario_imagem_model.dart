import '/flutter_flow/flutter_flow_util.dart';
import 'c_formulario_imagem_widget.dart' show CFormularioImagemWidget;
import 'package:flutter/material.dart';

class CFormularioImagemModel extends FlutterFlowModel<CFormularioImagemWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
