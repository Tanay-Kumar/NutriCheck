import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'add_preferences_widget.dart' show AddPreferencesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddPreferencesModel extends FlutterFlowModel<AddPreferencesWidget> {
  ///  Local state fields for this component.

  List<String> preferenceList = [];
  void addToPreferenceList(String item) => preferenceList.add(item);
  void removeFromPreferenceList(String item) => preferenceList.remove(item);
  void removeAtIndexFromPreferenceList(int index) =>
      preferenceList.removeAt(index);
  void insertAtIndexInPreferenceList(int index, String item) =>
      preferenceList.insert(index, item);
  void updatePreferenceListAtIndex(int index, Function(String) updateFn) =>
      preferenceList[index] = updateFn(preferenceList[index]);

  DocumentReference? deletePerferenceId;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in addPreferences widget.
  List<DietaryPreferencesRecord>? userPreferenceList;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
