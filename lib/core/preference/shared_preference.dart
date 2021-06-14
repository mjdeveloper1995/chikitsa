import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {

  static Future<void> setString(SharedPreferences sharedPreferences ,String title, String value) async {
    await sharedPreferences.setString(title, value);
  }

  static String getPrefString(SharedPreferences sharedPreferences,String title)  {
    final String value = sharedPreferences.getString(title) ?? '';
    return value;
  }
}
