import 'package:shared_preferences/shared_preferences.dart';

class GetLocal {
  static Future<String> getPassWord() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('passWord');
  }

  static Future<bool> getSwitchFingerprint() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('SwitchFingerprint') ?? false;
  }

  static Future<Map<String, Object>> getLoginEmail() async {
    Map<String, Object> data = {};
    SharedPreferences prefs = await SharedPreferences.getInstance();
    data['email'] = prefs.getString('email');
    data['passEmail'] = prefs.getString('passEmail');
    return data;
  }

  static Future<String> getLoginPhone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('phone');
  }
}
