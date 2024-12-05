import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtils {
  static late SharedPreferences sharedPreferences;

  // Initialize the shared preferences
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // Save data to shared preferences
  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is int) {
      return sharedPreferences.setInt(key, value);
    } else if (value is double) {
      return sharedPreferences.setDouble(key, value);
    } else if (value is String) {
      return sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return sharedPreferences.setBool(key, value);
    } else {
      throw ArgumentError("Unsupported value type");
    }
  }

  // Retrieve data from shared preferences
  static Object? getData({required String key}) {
    return sharedPreferences.get(key);
  }
}
