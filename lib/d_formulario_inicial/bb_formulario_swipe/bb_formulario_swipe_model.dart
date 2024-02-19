import '/flutter_flow/flutter_flow_util.dart';
import 'bb_formulario_swipe_widget.dart' show BbFormularioSwipeWidget;
import 'package:flutter/material.dart';

class BbFormularioSwipeModel extends FlutterFlowModel<BbFormularioSwipeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextFieldParoquias widget.
  FocusNode? textFieldParoquiasFocusNode1;
  TextEditingController? textFieldParoquiasController1;
  String? Function(BuildContext, String?)?
      textFieldParoquiasController1Validator;
  // State field(s) for TextFieldParoquias widget.
  FocusNode? textFieldParoquiasFocusNode2;
  TextEditingController? textFieldParoquiasController2;
  String? Function(BuildContext, String?)?
      textFieldParoquiasController2Validator;
  // State field(s) for TextFieldParoquias widget.
  FocusNode? textFieldParoquiasFocusNode3;
  TextEditingController? textFieldParoquiasController3;
  String? Function(BuildContext, String?)?
      textFieldParoquiasController3Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldParoquiasFocusNode1?.dispose();
    textFieldParoquiasController1?.dispose();

    textFieldParoquiasFocusNode2?.dispose();
    textFieldParoquiasController2?.dispose();

    textFieldParoquiasFocusNode3?.dispose();
    textFieldParoquiasController3?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
