import '/b_paginas_cria_conta/edit_profile_auth_2/edit_profile_auth2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'c_editar_perfil_widget.dart' show CEditarPerfilWidget;
import 'package:flutter/material.dart';

class CEditarPerfilModel extends FlutterFlowModel<CEditarPerfilWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for editProfile_auth_2 component.
  late EditProfileAuth2Model editProfileAuth2Model;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    editProfileAuth2Model = createModel(context, () => EditProfileAuth2Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    editProfileAuth2Model.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
