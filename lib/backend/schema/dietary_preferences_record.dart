import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DietaryPreferencesRecord extends FirestoreRecord {
  DietaryPreferencesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "preference" field.
  String? _preference;
  String get preference => _preference ?? '';
  bool hasPreference() => _preference != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _preference = snapshotData['preference'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dietary_preferences');

  static Stream<DietaryPreferencesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DietaryPreferencesRecord.fromSnapshot(s));

  static Future<DietaryPreferencesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => DietaryPreferencesRecord.fromSnapshot(s));

  static DietaryPreferencesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DietaryPreferencesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DietaryPreferencesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DietaryPreferencesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DietaryPreferencesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DietaryPreferencesRecord &&
      reference.path == other.reference.path;
}

Map<String, dynamic> createDietaryPreferencesRecordData({
  String? email,
  String? preference,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'preference': preference,
    }.withoutNulls,
  );

  return firestoreData;
}

class DietaryPreferencesRecordDocumentEquality
    implements Equality<DietaryPreferencesRecord> {
  const DietaryPreferencesRecordDocumentEquality();

  @override
  bool equals(DietaryPreferencesRecord? e1, DietaryPreferencesRecord? e2) {
    return e1?.email == e2?.email && e1?.preference == e2?.preference;
  }

  @override
  int hash(DietaryPreferencesRecord? e) =>
      const ListEquality().hash([e?.email, e?.preference]);

  @override
  bool isValidKey(Object? o) => o is DietaryPreferencesRecord;
}
