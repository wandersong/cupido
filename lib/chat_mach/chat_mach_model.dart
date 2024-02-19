import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_mach_widget.dart' show ChatMachWidget;
import 'package:flutter/material.dart';

class ChatMachModel extends FlutterFlowModel<ChatMachWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> listauser = [];
  void addToListauser(DocumentReference item) => listauser.add(item);
  void removeFromListauser(DocumentReference item) => listauser.remove(item);
  void removeAtIndexFromListauser(int index) => listauser.removeAt(index);
  void insertAtIndexInListauser(int index, DocumentReference item) =>
      listauser.insert(index, item);
  void updateListauserAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      listauser[index] = updateFn(listauser[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ChatRecord>? outputquery1;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatRecord? create1;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
