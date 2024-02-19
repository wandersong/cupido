import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'a_concetimento_model.dart';
export 'a_concetimento_model.dart';

class AConcetimentoWidget extends StatefulWidget {
  const AConcetimentoWidget({super.key});

  @override
  State<AConcetimentoWidget> createState() => _AConcetimentoWidgetState();
}

class _AConcetimentoWidgetState extends State<AConcetimentoWidget> {
  late AConcetimentoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AConcetimentoModel());
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
              children: [
                Expanded(
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: Container(
                      width: double.infinity,
                      height: 400.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Bem vindo ao Cupido Católico, o app de relacioanmentos feito para crustões. Importante: Nós faremos algumas perguntas mediante a aprovação de perfil para entender melhor o que você está procurando e conseguir assim manter um app relamente para pessoas com interesses cátolicos.',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed('A_FormularioSexo');
                  },
                  text: 'aceitar',
                  options: FFButtonOptions(
                    width: 300.0,
                    height: 46.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
