import 'package:dowerly/core/global_imports.dart';

class PrefUtils {
  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  static SharedPreferences? _sharedPreferences;
  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    if (kDebugMode) {
      print('SharedPreference Initialized');
    }
  }

  static Future<void> clearPreferencesData() async {
    await _sharedPreferences!.clear();
  }

  Future<void> setThemeData(String value) {
    return _sharedPreferences!.setString('themeData', value);
  }

  String getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData') ?? 'primary';
    } catch (e) {
      return 'primary';
    }
  }
}
