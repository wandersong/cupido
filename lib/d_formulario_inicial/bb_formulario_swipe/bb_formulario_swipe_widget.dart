import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'bb_formulario_swipe_model.dart';
export 'bb_formulario_swipe_model.dart';

class BbFormularioSwipeWidget extends StatefulWidget {
  const BbFormularioSwipeWidget({super.key});

  @override
  State<BbFormularioSwipeWidget> createState() =>
      _BbFormularioSwipeWidgetState();
}

class _BbFormularioSwipeWidgetState extends State<BbFormularioSwipeWidget> {
  late BbFormularioSwipeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BbFormularioSwipeModel());

    _model.textFieldParoquiasController1 ??= TextEditingController();
    _model.textFieldParoquiasFocusNode1 ??= FocusNode();

    _model.textFieldParoquiasController2 ??= TextEditingController();
    _model.textFieldParoquiasFocusNode2 ??= FocusNode();

    _model.textFieldParoquiasController3 ??= TextEditingController();
    _model.textFieldParoquiasFocusNode3 ??= FocusNode();
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
        backgroundColor: FlutterFlowTheme.of(context).secondary,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Text(
                      'Como você se chama?',
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily: 'Nunito',
                            fontSize: 18.0,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.textFieldParoquiasController1,
                              focusNode: _model.textFieldParoquiasFocusNode1,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                alignLabelWithHint: false,
                                hintText: 'Ex: Roberta',
                                errorStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito',
                                      color: FlutterFlowTheme.of(context).error,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              validator: _model
                                  .textFieldParoquiasController1Validator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Text(
                              'Qual sua Idade?',
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Nunito',
                                    fontSize: 18.0,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.textFieldParoquiasController2,
                              focusNode: _model.textFieldParoquiasFocusNode2,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                alignLabelWithHint: false,
                                hintText: 'Ex: 36 anos',
                                errorStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito',
                                      color: FlutterFlowTheme.of(context).error,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              validator: _model
                                  .textFieldParoquiasController2Validator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Text(
                              'Qual sua Cidade?',
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Nunito',
                                    fontSize: 18.0,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.textFieldParoquiasController3,
                              focusNode: _model.textFieldParoquiasFocusNode3,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                alignLabelWithHint: false,
                                hintText: 'Ex: Belo Horizonte/MG',
                                errorStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito',
                                      color: FlutterFlowTheme.of(context).error,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              validator: _model
                                  .textFieldParoquiasController3Validator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await currentUserReference!.update(createUsersRecordData(
                        displayName: _model.textFieldParoquiasController1.text,
                        idade: double.tryParse(
                            _model.textFieldParoquiasController2.text),
                        cidade:
                            (_model.textFieldParoquiasFocusNode3?.hasFocus ??
                                    false)
                                .toString(),
                      ));

                      context.pushNamed('B_CriarPerfiil');
                    },
                    text: 'Salvar e avançar',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 46.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Nunito',
                                color: Colors.white,
                              ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
