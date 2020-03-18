import 'package:shared_preferences/shared_preferences.dart';

class SpUtils {
  ///单例模式的一种写法，来自于：https://stackoverflow.com/questions/54057958/comparing-ways-to-create-singletons-in-dart
  SpUtils._privateConstructor();

  static final SpUtils _instance = SpUtils._privateConstructor();

  static SpUtils get instance {
    return _instance;
  }

  Future<bool> putString(String key, String value) async {
    var sp = await SharedPreferences.getInstance();
    return sp.setString(key, value);
  }

  Future<String> getString(String key, [String defaultValue = ""]) async {
    var sp = await SharedPreferences.getInstance();
    return sp.getString(key) ?? defaultValue;
  }
}
