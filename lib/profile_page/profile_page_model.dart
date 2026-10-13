import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/about_widget.dart';
import '/components/add_preferences_widget.dart';
import '/components/privacy_policy_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  Local state fields for this page.

  List<String> prefrenceList = [];
  void addToPrefrenceList(String item) => prefrenceList.add(item);
  void removeFromPrefrenceList(String item) => prefrenceList.remove(item);
  void removeAtIndexFromPrefrenceList(int index) =>
      prefrenceList.removeAt(index);
  void insertAtIndexInPrefrenceList(int index, String item) =>
      prefrenceList.insert(index, item);
  void updatePrefrenceListAtIndex(int index, Function(String) updateFn) =>
      prefrenceList[index] = updateFn(prefrenceList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in ProfilePage widget.
  List<DietaryPreferencesRecord>? userPreferenceList1;
  bool isDataUploading_profilePic = false;
  FFUploadedFile uploadedLocalFile_profilePic =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_profilePic = '';

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
