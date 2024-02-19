import '/flutter_flow/flutter_flow_util.dart';
import 'chat_widget.dart' show ChatWidget;
import 'package:flutter/material.dart';

class ChatModel extends FlutterFlowModel<ChatWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> listausers = [];
  void addToListausers(DocumentReference item) => listausers.add(item);
  void removeFromListausers(DocumentReference item) => listausers.remove(item);
  void removeAtIndexFromListausers(int index) => listausers.removeAt(index);
  void insertAtIndexInListausers(int index, DocumentReference item) =>
      listausers.insert(index, item);
  void updateListausersAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      listausers[index] = updateFn(listausers[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
