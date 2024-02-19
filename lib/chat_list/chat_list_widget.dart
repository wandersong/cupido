import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'chat_list_model.dart';
export 'chat_list_model.dart';

class ChatListWidget extends StatefulWidget {
  const ChatListWidget({super.key});

  @override
  State<ChatListWidget> createState() => _ChatListWidgetState();
}

class _ChatListWidgetState extends State<ChatListWidget> {
  late ChatListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatListModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final chatListUsersRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pushNamed('HomePageSwipe');
                },
              ),
              title: Text(
                'chats',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 16.0, 10.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 8.0, 10.0, 8.0),
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: 'pesquisar conversa',
                                labelStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                prefixIcon: const Icon(
                                  Icons.search_sharp,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              minLines: 1,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  StreamBuilder<List<ChatRecord>>(
                    stream: queryChatRecord(
                      queryBuilder: (chatRecord) => chatRecord.where(
                        'membros',
                        arrayContains: currentUserReference,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<ChatRecord> listViewChatRecordList = snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewChatRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewChatRecord =
                              listViewChatRecordList[listViewIndex];
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: StreamBuilder<UsersRecord>(
                              stream: UsersRecord.getDocument(listViewChatRecord
                                  .membros
                                  .where((e) => currentUserReference != e)
                                  .toList()
                                  .first),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                final containerUsersRecord = snapshot.data!;
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await actions.marcarMensagensComoLidas(
                                      listViewChatRecord.chaId!.id,
                                      currentUserReference!,
                                    );

                                    context.pushNamed(
                                      'chat',
                                      queryParameters: {
                                        'user': serializeParam(
                                          containerUsersRecord,
                                          ParamType.Document,
                                        ),
                                        'chat': serializeParam(
                                          listViewChatRecord,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'user': containerUsersRecord,
                                        'chat': listViewChatRecord,
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(12.0),
                                        bottomRight: Radius.circular(12.0),
                                        topLeft: Radius.circular(12.0),
                                        topRight: Radius.circular(12.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 40.0,
                                                height: 40.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  chatListUsersRecord.photoUrl,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      containerUsersRecord
                                                          .displayName,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito',
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                    Flexible(
                                                      child: RichText(
                                                        textScaleFactor:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaleFactor,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: 'você: ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Nunito',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                            const TextSpan(
                                                              text:
                                                                  'ultima mensagem ',
                                                              style:
                                                                  TextStyle(),
                                                            ),
                                                            const TextSpan(
                                                              text: ' -  9m',
                                                              style:
                                                                  TextStyle(),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Container(
                                              width: 23.0,
                                              height: 23.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                shape: BoxShape.circle,
                                              ),
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                listViewChatRecord.mensagens
                                                    .where((e) => !e.lidopor
                                                        .contains(
                                                            currentUserReference))
                                                    .toList()
                                                    .length
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Nunito',
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
