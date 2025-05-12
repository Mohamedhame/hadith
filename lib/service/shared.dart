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
}
