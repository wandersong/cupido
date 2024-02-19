import '/b_paginas_cria_conta/edit_profile_auth_2/edit_profile_auth2_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'c_editar_perfil_model.dart';
export 'c_editar_perfil_model.dart';

class CEditarPerfilWidget extends StatefulWidget {
  const CEditarPerfilWidget({super.key});

  @override
  State<CEditarPerfilWidget> createState() => _CEditarPerfilWidgetState();
}

class _CEditarPerfilWidgetState extends State<CEditarPerfilWidget>
    with TickerProviderStateMixin {
  late CEditarPerfilModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: const Offset(3.0, 3.0),
          end: const Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CEditarPerfilModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 130.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                ),
                child: Container(
                  width: 100.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        FlutterFlowTheme.of(context).primary,
                        FlutterFlowTheme.of(context).primary
                      ],
                      stops: const [0.0, 1.0],
                      begin: const AlignmentDirectional(0.0, -1.0),
                      end: const AlignmentDirectional(0, 1.0),
                    ),
                  ),
                  child: Align(
                    alignment: const AlignmentDirectional(-1.0, 1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 24.0),
                      child: FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).tertiary,
                        borderRadius: 12.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).secondary,
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          context.safePop();
                        },
                      ),
                    ),
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation']!),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 750.0,
                    constraints: const BoxConstraints(
                      maxWidth: 770.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: wrapWithModel(
                          model: _model.editProfileAuth2Model,
                          updateCallback: () => setState(() {}),
                          child: EditProfileAuth2Widget(
                            title: 'Editar Perfil',
                            confirmButtonText: 'Salvar alterações',
                            navigateAction: () async {
                              context.safePop();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
