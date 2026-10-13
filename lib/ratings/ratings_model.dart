import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'ratings_widget.dart' show RatingsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class RatingsModel extends FlutterFlowModel<RatingsWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - testung1] action in Ratings widget.
  List<String>? testprd;
  // Stores action output result for [Firestore Query - Query a collection] action in Ratings widget.
  List<DietaryPreferencesRecord>? userPreferenceList1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
