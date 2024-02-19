import '/flutter_flow/flutter_flow_util.dart';
import 'e_esqueceua_senha_widget.dart' show EEsqueceuaSenhaWidget;
import 'package:flutter/material.dart';

class EEsqueceuaSenhaModel extends FlutterFlowModel<EEsqueceuaSenhaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
