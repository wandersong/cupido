import '/flutter_flow/flutter_flow_util.dart';
import 'b_formulario_paroquia_widget.dart' show BFormularioParoquiaWidget;
import 'package:flutter/material.dart';

class BFormularioParoquiaModel
    extends FlutterFlowModel<BFormularioParoquiaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextFieldParoquias widget.
  FocusNode? textFieldParoquiasFocusNode;
  TextEditingController? textFieldParoquiasController;
  String? Function(BuildContext, String?)?
      textFieldParoquiasControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldParoquiasFocusNode?.dispose();
    textFieldParoquiasController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
