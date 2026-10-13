// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart' hide RepeatMode;
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

List<String> testung1(String? detais) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // Check if the input string is null or empty
  if (detais == null || detais.isEmpty) {
    return [];
  }

  // Split the data by hyphen and remove the first empty element (before the first hyphen)
  List<String> parts = detais.split('-').sublist(1);

  // Trim each part and store it in a new list
  List<String> ingredients = parts.map((part) => part.trim()).toList();

  // Return the list of ingredients
  return ingredients;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
