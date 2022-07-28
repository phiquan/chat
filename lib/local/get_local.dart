import 'package:shared_preferences/shared_preferences.dart';

class GetLocal {
  GetLocal._();

  static Future<bool> getSwitchFingerprint() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('SwitchFingerprint') ?? false;
  }

  static Future<bool> getEncryption() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('Encryption') ?? true;
  }
}
