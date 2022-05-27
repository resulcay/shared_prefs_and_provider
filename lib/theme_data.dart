import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData green = ThemeData(
    primarySwatch: Colors.green, scaffoldBackgroundColor: Colors.green.shade50);

ThemeData red = ThemeData(
    primarySwatch: Colors.red, scaffoldBackgroundColor: Colors.red.shade50);

class ThemeColorData with ChangeNotifier {
  static SharedPreferences? _sharedPreferencesObject;

  bool _isGreen = true;

  bool get isGreen => _isGreen;

  ThemeData get themeColor {
    return _isGreen ? green : red;
  }

  void toggleTheme() {
    _isGreen = !_isGreen;
    saveThemeToSharedPreferences(isGreen);
    notifyListeners();
  }

  Future<void> createSharedPreferencesObject() async {
    _sharedPreferencesObject = await SharedPreferences.getInstance();
  }

  void saveThemeToSharedPreferences(bool value) {
    _sharedPreferencesObject!.setBool('themeData', value);
  }

  void loadThemeFromSharedPreferences() async {
    _isGreen = _sharedPreferencesObject!.getBool('themeData') ?? true;
  }
}
