import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  static SharedPreferences? _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  static Future<void> setTheme(bool theme) async {
    await init();
    await _sharedPreferences!.setBool("theme", theme);
  }

  static Future<bool?> getTheme() async {
    await init();
    return _sharedPreferences!.getBool("theme");
  }

  static Future<void> setFontSizeHadith(double value) async {
    await init();
    _sharedPreferences!.setDouble("font", value);
  }

  static Future<double> getFontSizeHadith() async {
    await init();
    double? font = _sharedPreferences!.getDouble("font");
    if (font != null) {
      return font;
    }
    return 16.0;
  }

  static Future<void> saveAzkar(List listOfZekr) async {
    await init();
    String encodedList = jsonEncode(listOfZekr);
    await _sharedPreferences!.setString('listOfZekr', encodedList);
  }

  static Future<List> getListOfZekr() async {
    await init();
    String? encodedList = _sharedPreferences!.getString('listOfZekr');

    if (encodedList != null) {
      List decoded = jsonDecode(encodedList);
      return decoded;
    }
    return [];
  }

  static Future<bool> runOnlyOnFirstInstall() async {
    await init();
    final hasInitialized =
        _sharedPreferences!.getBool('has_initialized') ?? false;

    if (hasInitialized) {
      return false;
    }

    await _sharedPreferences!.setBool('has_initialized', true);
    return true;
  }
}
