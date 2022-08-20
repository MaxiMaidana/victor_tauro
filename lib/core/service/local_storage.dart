import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences prefs;

  static Future<void> configPrefs() async =>
      prefs = await SharedPreferences.getInstance();

  static Future<void> setPref(String key, bool value) async =>
      prefs.setBool(key, value);

  static bool getPref(String key) => prefs.getBool(key) ?? false;
}
