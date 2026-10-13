import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'ingredient_details_widget.dart' show IngredientDetailsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class IngredientDetailsModel extends FlutterFlowModel<IngredientDetailsWidget> {
  ///  Local state fields for this component.

  List<String> prefrencelist = [];
  void addToPrefrencelist(String item) => prefrencelist.add(item);
  void removeFromPrefrencelist(String item) => prefrencelist.remove(item);
  void removeAtIndexFromPrefrencelist(int index) =>
      prefrencelist.removeAt(index);
  void insertAtIndexInPrefrencelist(int index, String item) =>
      prefrencelist.insert(index, item);
  void updatePrefrencelistAtIndex(int index, Function(String) updateFn) =>
      prefrencelist[index] = updateFn(prefrencelist[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - testung1] action in IngredientDetails widget.
  List<String>? test;
  // Stores action output result for [Firestore Query - Query a collection] action in IngredientDetails widget.
  List<DietaryPreferencesRecord>? userPreferenceList;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
