import 'package:shared_preferences/shared_preferences.dart';

class GetLocal {
   static Future<bool> getSwitchFingerprint() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('SwitchFingerprint') ?? false;
  }
}
