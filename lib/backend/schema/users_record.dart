import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "BlurHash" field.
  String? _blurHash;
  String get blurHash => _blurHash ?? '';
  bool hasBlurHash() => _blurHash != null;

  // "photo_url2" field.
  String? _photoUrl2;
  String get photoUrl2 => _photoUrl2 ?? '';
  bool hasPhotoUrl2() => _photoUrl2 != null;

  // "photo_url3" field.
  String? _photoUrl3;
  String get photoUrl3 => _photoUrl3 ?? '';
  bool hasPhotoUrl3() => _photoUrl3 != null;

  // "paroquia" field.
  String? _paroquia;
  String get paroquia => _paroquia ?? '';
  bool hasParoquia() => _paroquia != null;

  // "photo_url_Perfil" field.
  String? _photoUrlPerfil;
  String get photoUrlPerfil => _photoUrlPerfil ?? '';
  bool hasPhotoUrlPerfil() => _photoUrlPerfil != null;

  // "cidade" field.
  String? _cidade;
  String get cidade => _cidade ?? '';
  bool hasCidade() => _cidade != null;

  // "like" field.
  List<String>? _like;
  List<String> get like => _like ?? const [];
  bool hasLike() => _like != null;

  // "dislike" field.
  List<String>? _dislike;
  List<String> get dislike => _dislike ?? const [];
  bool hasDislike() => _dislike != null;

  // "sexodesejado" field.
  String? _sexodesejado;
  String get sexodesejado => _sexodesejado ?? '';
  bool hasSexodesejado() => _sexodesejado != null;

  // "idade" field.
  double? _idade;
  double get idade => _idade ?? 0.0;
  bool hasIdade() => _idade != null;

  // "sexo" field.
  String? _sexo;
  String get sexo => _sexo ?? '';
  bool hasSexo() => _sexo != null;

  // "paroquiabatismo" field.
  String? _paroquiabatismo;
  String get paroquiabatismo => _paroquiabatismo ?? '';
  bool hasParoquiabatismo() => _paroquiabatismo != null;

  // "hobbies" field.
  List<String>? _hobbies;
  List<String> get hobbies => _hobbies ?? const [];
  bool hasHobbies() => _hobbies != null;

  // "virtudes" field.
  List<String>? _virtudes;
  List<String> get virtudes => _virtudes ?? const [];
  bool hasVirtudes() => _virtudes != null;

  // "defeitos" field.
  List<String>? _defeitos;
  List<String> get defeitos => _defeitos ?? const [];
  bool hasDefeitos() => _defeitos != null;

  // "escolaridade" field.
  String? _escolaridade;
  String get escolaridade => _escolaridade ?? '';
  bool hasEscolaridade() => _escolaridade != null;

  // "altura" field.
  double? _altura;
  double get altura => _altura ?? 0.0;
  bool hasAltura() => _altura != null;

  // "comprometimento" field.
  String? _comprometimento;
  String get comprometimento => _comprometimento ?? '';
  bool hasComprometimento() => _comprometimento != null;

  // "datanascimento" field.
  DateTime? _datanascimento;
  DateTime? get datanascimento => _datanascimento;
  bool hasDatanascimento() => _datanascimento != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _title = snapshotData['title'] as String?;
    _blurHash = snapshotData['BlurHash'] as String?;
    _photoUrl2 = snapshotData['photo_url2'] as String?;
    _photoUrl3 = snapshotData['photo_url3'] as String?;
    _paroquia = snapshotData['paroquia'] as String?;
    _photoUrlPerfil = snapshotData['photo_url_Perfil'] as String?;
    _cidade = snapshotData['cidade'] as String?;
    _like = getDataList(snapshotData['like']);
    _dislike = getDataList(snapshotData['dislike']);
    _sexodesejado = snapshotData['sexodesejado'] as String?;
    _idade = castToType<double>(snapshotData['idade']);
    _sexo = snapshotData['sexo'] as String?;
    _paroquiabatismo = snapshotData['paroquiabatismo'] as String?;
    _hobbies = getDataList(snapshotData['hobbies']);
    _virtudes = getDataList(snapshotData['virtudes']);
    _defeitos = getDataList(snapshotData['defeitos']);
    _escolaridade = snapshotData['escolaridade'] as String?;
    _altura = castToType<double>(snapshotData['altura']);
    _comprometimento = snapshotData['comprometimento'] as String?;
    _datanascimento = snapshotData['datanascimento'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? shortDescription,
  DateTime? lastActiveTime,
  String? title,
  String? blurHash,
  String? photoUrl2,
  String? photoUrl3,
  String? paroquia,
  String? photoUrlPerfil,
  String? cidade,
  String? sexodesejado,
  double? idade,
  String? sexo,
  String? paroquiabatismo,
  String? escolaridade,
  double? altura,
  String? comprometimento,
  DateTime? datanascimento,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'title': title,
      'BlurHash': blurHash,
      'photo_url2': photoUrl2,
      'photo_url3': photoUrl3,
      'paroquia': paroquia,
      'photo_url_Perfil': photoUrlPerfil,
      'cidade': cidade,
      'sexodesejado': sexodesejado,
      'idade': idade,
      'sexo': sexo,
      'paroquiabatismo': paroquiabatismo,
      'escolaridade': escolaridade,
      'altura': altura,
      'comprometimento': comprometimento,
      'datanascimento': datanascimento,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.title == e2?.title &&
        e1?.blurHash == e2?.blurHash &&
        e1?.photoUrl2 == e2?.photoUrl2 &&
        e1?.photoUrl3 == e2?.photoUrl3 &&
        e1?.paroquia == e2?.paroquia &&
        e1?.photoUrlPerfil == e2?.photoUrlPerfil &&
        e1?.cidade == e2?.cidade &&
        listEquality.equals(e1?.like, e2?.like) &&
        listEquality.equals(e1?.dislike, e2?.dislike) &&
        e1?.sexodesejado == e2?.sexodesejado &&
        e1?.idade == e2?.idade &&
        e1?.sexo == e2?.sexo &&
        e1?.paroquiabatismo == e2?.paroquiabatismo &&
        listEquality.equals(e1?.hobbies, e2?.hobbies) &&
        listEquality.equals(e1?.virtudes, e2?.virtudes) &&
        listEquality.equals(e1?.defeitos, e2?.defeitos) &&
        e1?.escolaridade == e2?.escolaridade &&
        e1?.altura == e2?.altura &&
        e1?.comprometimento == e2?.comprometimento &&
        e1?.datanascimento == e2?.datanascimento;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.title,
        e?.blurHash,
        e?.photoUrl2,
        e?.photoUrl3,
        e?.paroquia,
        e?.photoUrlPerfil,
        e?.cidade,
        e?.like,
        e?.dislike,
        e?.sexodesejado,
        e?.idade,
        e?.sexo,
        e?.paroquiabatismo,
        e?.hobbies,
        e?.virtudes,
        e?.defeitos,
        e?.escolaridade,
        e?.altura,
        e?.comprometimento,
        e?.datanascimento
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
