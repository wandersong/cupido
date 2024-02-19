import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ChatRecord extends FirestoreRecord {
  ChatRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "criado_por" field.
  DocumentReference? _criadoPor;
  DocumentReference? get criadoPor => _criadoPor;
  bool hasCriadoPor() => _criadoPor != null;

  // "cha_id" field.
  DocumentReference? _chaId;
  DocumentReference? get chaId => _chaId;
  bool hasChaId() => _chaId != null;

  // "data_criado" field.
  DateTime? _dataCriado;
  DateTime? get dataCriado => _dataCriado;
  bool hasDataCriado() => _dataCriado != null;

  // "membros" field.
  List<DocumentReference>? _membros;
  List<DocumentReference> get membros => _membros ?? const [];
  bool hasMembros() => _membros != null;

  // "mensagens" field.
  List<MensagensStruct>? _mensagens;
  List<MensagensStruct> get mensagens => _mensagens ?? const [];
  bool hasMensagens() => _mensagens != null;

  void _initializeFields() {
    _criadoPor = snapshotData['criado_por'] as DocumentReference?;
    _chaId = snapshotData['cha_id'] as DocumentReference?;
    _dataCriado = snapshotData['data_criado'] as DateTime?;
    _membros = getDataList(snapshotData['membros']);
    _mensagens = getStructList(
      snapshotData['mensagens'],
      MensagensStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat');

  static Stream<ChatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatRecord.fromSnapshot(s));

  static Future<ChatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatRecord.fromSnapshot(s));

  static ChatRecord fromSnapshot(DocumentSnapshot snapshot) => ChatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatRecordData({
  DocumentReference? criadoPor,
  DocumentReference? chaId,
  DateTime? dataCriado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'criado_por': criadoPor,
      'cha_id': chaId,
      'data_criado': dataCriado,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatRecordDocumentEquality implements Equality<ChatRecord> {
  const ChatRecordDocumentEquality();

  @override
  bool equals(ChatRecord? e1, ChatRecord? e2) {
    const listEquality = ListEquality();
    return e1?.criadoPor == e2?.criadoPor &&
        e1?.chaId == e2?.chaId &&
        e1?.dataCriado == e2?.dataCriado &&
        listEquality.equals(e1?.membros, e2?.membros) &&
        listEquality.equals(e1?.mensagens, e2?.mensagens);
  }

  @override
  int hash(ChatRecord? e) => const ListEquality()
      .hash([e?.criadoPor, e?.chaId, e?.dataCriado, e?.membros, e?.mensagens]);

  @override
  bool isValidKey(Object? o) => o is ChatRecord;
}
