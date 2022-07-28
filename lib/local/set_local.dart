import 'package:shared_preferences/shared_preferences.dart';

class SetLocal {
  SetLocal._();

  ///[setSwitchFingerprint] thiết lập có xác thực sinh trắc hay không
  static Future<void> setSwitchFingerprint(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('SwitchFingerprint', value);
  }

  static Future<void> setEncryption(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('Encryption', value);
  }
}
