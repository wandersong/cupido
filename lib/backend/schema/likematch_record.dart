import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class LikematchRecord extends FirestoreRecord {
  LikematchRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nome" field.
  List<DocumentReference>? _nome;
  List<DocumentReference> get nome => _nome ?? const [];
  bool hasNome() => _nome != null;

  // "photo" field.
  DocumentReference? _photo;
  DocumentReference? get photo => _photo;
  bool hasPhoto() => _photo != null;

  // "match" field.
  DocumentReference? _match;
  DocumentReference? get match => _match;
  bool hasMatch() => _match != null;

  void _initializeFields() {
    _nome = getDataList(snapshotData['nome']);
    _photo = snapshotData['photo'] as DocumentReference?;
    _match = snapshotData['match'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('likematch');

  static Stream<LikematchRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LikematchRecord.fromSnapshot(s));

  static Future<LikematchRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LikematchRecord.fromSnapshot(s));

  static LikematchRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LikematchRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LikematchRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LikematchRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LikematchRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LikematchRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLikematchRecordData({
  DocumentReference? photo,
  DocumentReference? match,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'photo': photo,
      'match': match,
    }.withoutNulls,
  );

  return firestoreData;
}

class LikematchRecordDocumentEquality implements Equality<LikematchRecord> {
  const LikematchRecordDocumentEquality();

  @override
  bool equals(LikematchRecord? e1, LikematchRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.nome, e2?.nome) &&
        e1?.photo == e2?.photo &&
        e1?.match == e2?.match;
  }

  @override
  int hash(LikematchRecord? e) =>
      const ListEquality().hash([e?.nome, e?.photo, e?.match]);

  @override
  bool isValidKey(Object? o) => o is LikematchRecord;
}
