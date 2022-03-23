import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveTheme(value) async {
    return await sharedPreferences.setBool('theme', value);
  }

  static bool? getTheme() {
    return sharedPreferences.getBool('theme');
  }
}
