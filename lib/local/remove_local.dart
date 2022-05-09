import 'package:shared_preferences/shared_preferences.dart';

class RemoveLocal {
  ///[removeLogin] khi login thì xóa email,pass hoặc sđt khỏi local
  static Future<void> removeLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
    prefs.remove('passEmail');
    prefs.remove('phone');
  }
}
