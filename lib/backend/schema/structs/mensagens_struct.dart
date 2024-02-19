// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MensagensStruct extends FFFirebaseStruct {
  MensagensStruct({
    String? texto,
    DocumentReference? enviadopor,
    DateTime? dataenvio,
    List<DocumentReference>? lidopor,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _texto = texto,
        _enviadopor = enviadopor,
        _dataenvio = dataenvio,
        _lidopor = lidopor,
        super(firestoreUtilData);

  // "texto" field.
  String? _texto;
  String get texto => _texto ?? '';
  set texto(String? val) => _texto = val;
  bool hasTexto() => _texto != null;

  // "enviadopor" field.
  DocumentReference? _enviadopor;
  DocumentReference? get enviadopor => _enviadopor;
  set enviadopor(DocumentReference? val) => _enviadopor = val;
  bool hasEnviadopor() => _enviadopor != null;

  // "dataenvio" field.
  DateTime? _dataenvio;
  DateTime? get dataenvio => _dataenvio;
  set dataenvio(DateTime? val) => _dataenvio = val;
  bool hasDataenvio() => _dataenvio != null;

  // "lidopor" field.
  List<DocumentReference>? _lidopor;
  List<DocumentReference> get lidopor => _lidopor ?? const [];
  set lidopor(List<DocumentReference>? val) => _lidopor = val;
  void updateLidopor(Function(List<DocumentReference>) updateFn) =>
      updateFn(_lidopor ??= []);
  bool hasLidopor() => _lidopor != null;

  static MensagensStruct fromMap(Map<String, dynamic> data) => MensagensStruct(
        texto: data['texto'] as String?,
        enviadopor: data['enviadopor'] as DocumentReference?,
        dataenvio: data['dataenvio'] as DateTime?,
        lidopor: getDataList(data['lidopor']),
      );

  static MensagensStruct? maybeFromMap(dynamic data) => data is Map
      ? MensagensStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'texto': _texto,
        'enviadopor': _enviadopor,
        'dataenvio': _dataenvio,
        'lidopor': _lidopor,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'texto': serializeParam(
          _texto,
          ParamType.String,
        ),
        'enviadopor': serializeParam(
          _enviadopor,
          ParamType.DocumentReference,
        ),
        'dataenvio': serializeParam(
          _dataenvio,
          ParamType.DateTime,
        ),
        'lidopor': serializeParam(
          _lidopor,
          ParamType.DocumentReference,
          true,
        ),
      }.withoutNulls;

  static MensagensStruct fromSerializableMap(Map<String, dynamic> data) =>
      MensagensStruct(
        texto: deserializeParam(
          data['texto'],
          ParamType.String,
          false,
        ),
        enviadopor: deserializeParam(
          data['enviadopor'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        dataenvio: deserializeParam(
          data['dataenvio'],
          ParamType.DateTime,
          false,
        ),
        lidopor: deserializeParam<DocumentReference>(
          data['lidopor'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['users'],
        ),
      );

  @override
  String toString() => 'MensagensStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MensagensStruct &&
        texto == other.texto &&
        enviadopor == other.enviadopor &&
        dataenvio == other.dataenvio &&
        listEquality.equals(lidopor, other.lidopor);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([texto, enviadopor, dataenvio, lidopor]);
}

MensagensStruct createMensagensStruct({
  String? texto,
  DocumentReference? enviadopor,
  DateTime? dataenvio,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MensagensStruct(
      texto: texto,
      enviadopor: enviadopor,
      dataenvio: dataenvio,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MensagensStruct? updateMensagensStruct(
  MensagensStruct? mensagens, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    mensagens
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMensagensStructData(
  Map<String, dynamic> firestoreData,
  MensagensStruct? mensagens,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (mensagens == null) {
    return;
  }
  if (mensagens.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && mensagens.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mensagensData = getMensagensFirestoreData(mensagens, forFieldValue);
  final nestedData = mensagensData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = mensagens.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMensagensFirestoreData(
  MensagensStruct? mensagens, [
  bool forFieldValue = false,
]) {
  if (mensagens == null) {
    return {};
  }
  final firestoreData = mapToFirestore(mensagens.toMap());

  // Add any Firestore field values
  mensagens.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMensagensListFirestoreData(
  List<MensagensStruct>? mensagenss,
) =>
    mensagenss?.map((e) => getMensagensFirestoreData(e, true)).toList() ?? [];
