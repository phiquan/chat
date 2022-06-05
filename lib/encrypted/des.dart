import 'dart:convert';
import 'package:dart_des/dart_des.dart';

class Des {
  Des._();

  static String key = '12345678';

  static String encrypted(String text) {
    List<int> encrypted;
    DES desECB = DES(key: key.codeUnits, mode: DESMode.ECB);
    encrypted = desECB.encrypt(text.codeUnits);
    return base64.encode(encrypted);
  }

  static String decrypted(String text) {
    List<int> decrypted;
    DES desECB = DES(key: key.codeUnits, mode: DESMode.ECB);
    decrypted = desECB.decrypt(base64.decode(text));
    return utf8.decode(decrypted);
  }
}
