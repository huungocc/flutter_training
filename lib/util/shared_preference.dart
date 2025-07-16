import 'package:shared_preferences/shared_preferences.dart';

class SPrefCache {
  static const String deviceUDID = "device_udid";
}

class SharedPreferenceUtil {
  static Future<void> saveDeviceUDID(String deviceId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(SPrefCache.deviceUDID, deviceId);
  }

  static Future<String?> getDeviceUDID() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(SPrefCache.deviceUDID);
  }
}
