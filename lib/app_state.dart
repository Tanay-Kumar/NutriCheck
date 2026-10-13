import 'package:flutter/material.dart'
    show ChangeNotifier, Color, Colors, VoidCallback;
import '/backend/backend.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _unhealthyScore = '';
  String get unhealthyScore => _unhealthyScore;
  set unhealthyScore(String value) {
    _unhealthyScore = value;
  }

  String _productName = '';
  String get productName => _productName;
  set productName(String value) {
    _productName = value;
  }

  String _ingredientPercentage = '';
  String get ingredientPercentage => _ingredientPercentage;
  set ingredientPercentage(String value) {
    _ingredientPercentage = value;
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
  }

  bool _buttonPressed = false;
  bool get buttonPressed => _buttonPressed;
  set buttonPressed(bool value) {
    _buttonPressed = value;
  }
}
