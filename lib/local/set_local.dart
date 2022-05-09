import 'package:shared_preferences/shared_preferences.dart';

class SetLocal {

  ///[setPassWord] thiết lập mật khẩu bảo vệ khi vào app
  static Future<void> setPassWord(String pass) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('passWord', pass);
  }

  ///[setSwitchFingerprint] thiết lập có xác thực sinh trắc hay không
  static Future<void> setSwitchFingerprint(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('SwitchFingerprint', value);
  }

  ///[setLoginEmail] thiết lập email, pass khi login vào app
  static Future<void> setLoginEmail(String email, String pass) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
    prefs.setString('passEmail', pass);
  }

  ///[setLoginPhone] thiết lập sđt login vào app
  static Future<void> setLoginPhone(String phone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('phone', phone);
  }
}
