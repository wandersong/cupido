import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';
import 'edit_profile_auth2_model.dart';
export 'edit_profile_auth2_model.dart';

class EditProfileAuth2Widget extends StatefulWidget {
  const EditProfileAuth2Widget({
    super.key,
    String? title,
    String? confirmButtonText,
    required this.navigateAction,
  })  : title = title ?? 'Edit Profile',
        confirmButtonText = confirmButtonText ?? 'Save Changes';

  final String title;
  final String confirmButtonText;
  final Future Function()? navigateAction;

  @override
  State<EditProfileAuth2Widget> createState() => _EditProfileAuth2WidgetState();
}

class _EditProfileAuth2WidgetState extends State<EditProfileAuth2Widget> {
  late EditProfileAuth2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileAuth2Model());

    _model.yourNameController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.yourNameFocusNode ??= FocusNode();

    _model.myBioController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.shortDescription, ''));
    _model.myBioFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _model.formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Align(
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
              child: Text(
                widget.title,
                style: FlutterFlowTheme.of(context).headlineLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 0.0, 0.0),
              child: Text(
                'Ajuste o conteúdo abaixo para atualizar seu perfil.',
                style: FlutterFlowTheme.of(context).labelLarge,
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            width: 130.0,
                            height: 130.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).accent2,
                              borderRadius: BorderRadius.circular(4.0),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).secondary,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      imageQuality: 70,
                                      allowPhoto: true,
                                      includeDimensions: true,
                                      includeBlurHash: true,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                      textColor:
                                          FlutterFlowTheme.of(context).primary,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      setState(
                                          () => _model.isDataUploading1 = true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];

                                      var downloadUrls = <String>[];
                                      try {
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                ))
                                            .toList();

                                        downloadUrls = (await Future.wait(
                                          selectedMedia.map(
                                            (m) async => await uploadData(
                                                m.storagePath, m.bytes),
                                          ),
                                        ))
                                            .where((u) => u != null)
                                            .map((u) => u!)
                                            .toList();
                                      } finally {
                                        _model.isDataUploading1 = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        setState(() {
                                          _model.uploadedLocalFile1 =
                                              selectedUploadedFiles.first;
                                          _model.uploadedFileUrl1 =
                                              downloadUrls.first;
                                        });
                                      } else {
                                        setState(() {});
                                        return;
                                      }
                                    }

                                    if (_model.uploadedFileUrl1 != '') {
                                      if (currentUserPhoto != '') {
                                        await FirebaseStorage.instance
                                            .refFromURL(currentUserPhoto)
                                            .delete();
                                      }

                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        photoUrl: _model.uploadedFileUrl1,
                                        blurHash:
                                            _model.uploadedLocalFile1.blurHash,
                                      ));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'A imagem foi alterada com sucesso!',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Nunito',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                      setState(() {
                                        _model.isDataUploading1 = false;
                                        _model.uploadedLocalFile1 =
                                            FFUploadedFile(
                                                bytes: Uint8List.fromList([]));
                                        _model.uploadedFileUrl1 = '';
                                      });
                                    } else {
                                      return;
                                    }
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: OctoImage(
                                      placeholderBuilder:
                                          OctoPlaceholder.blurHash(
                                        valueOrDefault(
                                            currentUserDocument?.blurHash, ''),
                                      ),
                                      image: CachedNetworkImageProvider(
                                        valueOrDefault<String>(
                                          currentUserPhoto,
                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dating-cupido-catolico-u8vab5/assets/s08anevt7xzt/parte-frontal-do-usuario-com-fundo-branco.jpg',
                                        ),
                                      ),
                                      width: 300.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Image.asset(
                                        'assets/images/error_image.png',
                                        width: 300.0,
                                        height: 200.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            width: 130.0,
                            height: 130.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).accent2,
                              borderRadius: BorderRadius.circular(4.0),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).secondary,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      imageQuality: 70,
                                      allowPhoto: true,
                                      includeDimensions: true,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                      textColor:
                                          FlutterFlowTheme.of(context).primary,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      setState(
                                          () => _model.isDataUploading2 = true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];

                                      var downloadUrls = <String>[];
                                      try {
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                ))
                                            .toList();

                                        downloadUrls = (await Future.wait(
                                          selectedMedia.map(
                                            (m) async => await uploadData(
                                                m.storagePath, m.bytes),
                                          ),
                                        ))
                                            .where((u) => u != null)
                                            .map((u) => u!)
                                            .toList();
                                      } finally {
                                        _model.isDataUploading2 = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        setState(() {
                                          _model.uploadedLocalFile2 =
                                              selectedUploadedFiles.first;
                                          _model.uploadedFileUrl2 =
                                              downloadUrls.first;
                                        });
                                      } else {
                                        setState(() {});
                                        return;
                                      }
                                    }

                                    if (_model.uploadedFileUrl2 != '') {
                                      if (valueOrDefault(
                                                  currentUserDocument
                                                      ?.photoUrl2,
                                                  '') !=
                                              '') {
                                        await FirebaseStorage.instance
                                            .refFromURL(_model.uploadedFileUrl2)
                                            .delete();
                                      }

                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        photoUrl2: _model.uploadedFileUrl2,
                                      ));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'A imagem foi alterada com sucesso!',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily: 'Nunito',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                      setState(() {
                                        _model.isDataUploading2 = false;
                                        _model.uploadedLocalFile2 =
                                            FFUploadedFile(
                                                bytes: Uint8List.fromList([]));
                                        _model.uploadedFileUrl2 = '';
                                      });
                                    } else {
                                      return;
                                    }
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: CachedNetworkImage(
                                      fadeInDuration:
                                          const Duration(milliseconds: 200),
                                      fadeOutDuration:
                                          const Duration(milliseconds: 200),
                                      imageUrl: valueOrDefault<String>(
                                        valueOrDefault(
                                            currentUserDocument?.photoUrl2, ''),
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dating-cupido-catolico-u8vab5/assets/s08anevt7xzt/parte-frontal-do-usuario-com-fundo-branco.jpg',
                                      ),
                                      width: 300.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                      errorWidget:
                                          (context, error, stackTrace) =>
                                              Image.asset(
                                        'assets/images/error_image.png',
                                        width: 300.0,
                                        height: 200.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            width: 130.0,
                            height: 130.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).accent2,
                              borderRadius: BorderRadius.circular(12.0),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).secondary,
                                width: 2.0,
                              ),
                            ),
                            child: AuthUserStreamWidget(
                              builder: (context) => InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    imageQuality: 70,
                                    allowPhoto: true,
                                    includeDimensions: true,
                                    includeBlurHash: true,
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                    textColor:
                                        FlutterFlowTheme.of(context).primary,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    setState(
                                        () => _model.isDataUploading3 = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    var downloadUrls = <String>[];
                                    try {
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                              ))
                                          .toList();

                                      downloadUrls = (await Future.wait(
                                        selectedMedia.map(
                                          (m) async => await uploadData(
                                              m.storagePath, m.bytes),
                                        ),
                                      ))
                                          .where((u) => u != null)
                                          .map((u) => u!)
                                          .toList();
                                    } finally {
                                      _model.isDataUploading3 = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                            selectedMedia.length &&
                                        downloadUrls.length ==
                                            selectedMedia.length) {
                                      setState(() {
                                        _model.uploadedLocalFile3 =
                                            selectedUploadedFiles.first;
                                        _model.uploadedFileUrl3 =
                                            downloadUrls.first;
                                      });
                                    } else {
                                      setState(() {});
                                      return;
                                    }
                                  }

                                  if (_model.uploadedFileUrl3 != '') {
                                    if (valueOrDefault(
                                                currentUserDocument?.photoUrl3,
                                                '') !=
                                            '') {
                                      await FirebaseStorage.instance
                                          .refFromURL(_model.uploadedFileUrl3)
                                          .delete();
                                    }

                                    await currentUserReference!
                                        .update(createUsersRecordData(
                                      photoUrl3: _model.uploadedFileUrl3,
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
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    setState(() {
                                      _model.isDataUploading3 = false;
                                      _model.uploadedLocalFile3 =
                                          FFUploadedFile(
                                              bytes: Uint8List.fromList([]));
                                      _model.uploadedFileUrl3 = '';
                                    });
                                  } else {
                                    return;
                                  }
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      valueOrDefault(
                                          currentUserDocument?.photoUrl3, ''),
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dating-cupido-catolico-u8vab5/assets/s08anevt7xzt/parte-frontal-do-usuario-com-fundo-branco.jpg',
                                    ),
                                    width: 300.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
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
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
              child: AuthUserStreamWidget(
                builder: (context) => TextFormField(
                  controller: _model.yourNameController,
                  focusNode: _model.yourNameFocusNode,
                  autofillHints: const [AutofillHints.name],
                  textCapitalization: TextCapitalization.words,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Nome e Sobrenome',
                    labelStyle: FlutterFlowTheme.of(context).labelMedium,
                    hintText: 'Escreva se nome e sobrenome',
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    errorStyle:
                        FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito',
                              color: FlutterFlowTheme.of(context).error,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
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
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 12.0),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  cursorColor: FlutterFlowTheme.of(context).primary,
                  validator:
                      _model.yourNameControllerValidator.asValidator(context),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
              child: AuthUserStreamWidget(
                builder: (context) => TextFormField(
                  controller: _model.myBioController,
                  focusNode: _model.myBioFocusNode,
                  textCapitalization: TextCapitalization.sentences,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelStyle: FlutterFlowTheme.of(context).labelMedium,
                    hintText: 'Conte um pouco sobre você',
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    errorStyle:
                        FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito',
                              color: FlutterFlowTheme.of(context).error,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
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
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 12.0),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  textAlign: TextAlign.start,
                  maxLines: 3,
                  cursorColor: FlutterFlowTheme.of(context).primary,
                  validator:
                      _model.myBioControllerValidator.asValidator(context),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (_model.formKey.currentState == null ||
                        !_model.formKey.currentState!.validate()) {
                      return;
                    }
                    // updateUserInfo

                    await currentUserReference!.update(createUsersRecordData(
                      displayName: _model.yourNameController.text,
                      shortDescription: _model.myBioController.text,
                      lastActiveTime: getCurrentTimestamp,
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'O perfil foi atualizado!',
                          style:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Nunito',
                                    color: FlutterFlowTheme.of(context).info,
                                  ),
                        ),
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                      ),
                    );
                    await widget.navigateAction?.call();

                    context.pushNamed('HomePageSwipe');
                  },
                  text: widget.confirmButtonText,
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 46.0,
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Nunito',
                          color: FlutterFlowTheme.of(context).tertiary,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
