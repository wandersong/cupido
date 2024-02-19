import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'c_formulario_imagem_model.dart';
export 'c_formulario_imagem_model.dart';

class CFormularioImagemWidget extends StatefulWidget {
  const CFormularioImagemWidget({super.key});

  @override
  State<CFormularioImagemWidget> createState() =>
      _CFormularioImagemWidgetState();
}

class _CFormularioImagemWidgetState extends State<CFormularioImagemWidget> {
  late CFormularioImagemModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CFormularioImagemModel());
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
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Text(
                      'Escolha sua foto de perfil',
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Nunito',
                            color: FlutterFlowTheme.of(context).tertiary,
                            fontSize: 26.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 40.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        final selectedMedia = await selectMedia(
                          imageQuality: 70,
                          includeDimensions: true,
                          mediaSource: MediaSource.photoGallery,
                          multiImage: false,
                        );
                        if (selectedMedia != null &&
                            selectedMedia.every((m) =>
                                validateFileFormat(m.storagePath, context))) {
                          setState(() => _model.isDataUploading = true);
                          var selectedUploadedFiles = <FFUploadedFile>[];

                          var downloadUrls = <String>[];
                          try {
                            selectedUploadedFiles = selectedMedia
                                .map((m) => FFUploadedFile(
                                      name: m.storagePath.split('/').last,
                                      bytes: m.bytes,
                                      height: m.dimensions?.height,
                                      width: m.dimensions?.width,
                                      blurHash: m.blurHash,
                                    ))
                                .toList();

                            downloadUrls = (await Future.wait(
                              selectedMedia.map(
                                (m) async =>
                                    await uploadData(m.storagePath, m.bytes),
                              ),
                            ))
                                .where((u) => u != null)
                                .map((u) => u!)
                                .toList();
                          } finally {
                            _model.isDataUploading = false;
                          }
                          if (selectedUploadedFiles.length ==
                                  selectedMedia.length &&
                              downloadUrls.length == selectedMedia.length) {
                            setState(() {
                              _model.uploadedLocalFile =
                                  selectedUploadedFiles.first;
                              _model.uploadedFileUrl = downloadUrls.first;
                            });
                          } else {
                            setState(() {});
                            return;
                          }
                        }

                        if (_model.uploadedFileUrl != '') {
                          if (currentUserPhoto != '') {
                            await FirebaseStorage.instance
                                .refFromURL(valueOrDefault(
                                    currentUserDocument?.photoUrlPerfil, ''))
                                .delete();
                          }

                          await currentUserReference!
                              .update(createUsersRecordData(
                            photoUrlPerfil: _model.uploadedFileUrl,
                          ));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'A imagem foi alterada com sucesso!',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Nunito',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                          setState(() {
                            _model.isDataUploading = false;
                            _model.uploadedLocalFile =
                                FFUploadedFile(bytes: Uint8List.fromList([]));
                            _model.uploadedFileUrl = '';
                          });
                        } else {
                          return;
                        }
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(120.0),
                        child: Image.network(
                          valueOrDefault<String>(
                            valueOrDefault(
                                currentUserDocument?.photoUrlPerfil, ''),
                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dating-cupido-catolico-u8vab5/assets/s08anevt7xzt/parte-frontal-do-usuario-com-fundo-branco.jpg',
                          ),
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed('Bb_FormularioSwipe');
                    },
                    text: 'Salvar e avançar',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 46.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).tertiary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Nunito',
                                color: FlutterFlowTheme.of(context).primary,
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
