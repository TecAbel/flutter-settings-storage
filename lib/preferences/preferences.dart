import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _preferences;

  static String _name = 'Abel';
  static int _gender = 1;
  static bool _isDarkMode = false;

  static Future<SharedPreferences> init() async {
    _preferences = await SharedPreferences.getInstance();
    return _preferences;
  }

  static String get name {
    return _preferences.getString('name') ?? _name;
  }

  static set name(String name) {
    _name = name;
    _preferences.setString('name', name);
  }

  static int get gender {
    return _preferences.getInt('gender') ?? _gender;
  }

  static set gender(int gender) {
    _gender = gender;
    _preferences.setInt('gender', gender);
  }

  static bool get isDarkMode {
    return _preferences.getBool('dark') ?? _isDarkMode;
  }

  static set isDarkMode(bool dark) {
    _isDarkMode = dark;
    _preferences.setBool('dark', dark);
  }
}
