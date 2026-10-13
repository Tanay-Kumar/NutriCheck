import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImagesRecord extends FirestoreRecord {
  ImagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
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

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "text_read" field.
  String? _textRead;
  String get textRead => _textRead ?? '';
  bool hasTextRead() => _textRead != null;

  // "score" field.
  String? _score;
  String get score => _score ?? '';
  bool hasScore() => _score != null;

  // "time_created" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  bool hasTimeCreated() => _timeCreated != null;

  // "product_name" field.
  String? _productName;
  String get productName => _productName ?? '';
  bool hasProductName() => _productName != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photo = snapshotData['photo'] as String?;
    _textRead = snapshotData['text_read'] as String?;
    _score = snapshotData['score'] as String?;
    _timeCreated = snapshotData['time_created'] as DateTime?;
    _productName = snapshotData['product_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Images');

  static Stream<ImagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ImagesRecord.fromSnapshot(s));

  static Future<ImagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ImagesRecord.fromSnapshot(s));

  static ImagesRecord fromSnapshot(DocumentSnapshot snapshot) => ImagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ImagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ImagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ImagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ImagesRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createImagesRecordData({
  String? email,
  String? displayName,
  String? photo,
  String? textRead,
  String? score,
  DateTime? timeCreated,
  String? productName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo': photo,
      'text_read': textRead,
      'score': score,
      'time_created': timeCreated,
      'product_name': productName,
    }.withoutNulls,
  );

  return firestoreData;
}

class ImagesRecordDocumentEquality implements Equality<ImagesRecord> {
  const ImagesRecordDocumentEquality();

  @override
  bool equals(ImagesRecord? e1, ImagesRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photo == e2?.photo &&
        e1?.textRead == e2?.textRead &&
        e1?.score == e2?.score &&
        e1?.timeCreated == e2?.timeCreated &&
        e1?.productName == e2?.productName;
  }

  @override
  int hash(ImagesRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photo,
        e?.textRead,
        e?.score,
        e?.timeCreated,
        e?.productName
      ]);

  @override
  bool isValidKey(Object? o) => o is ImagesRecord;
}
