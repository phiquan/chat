import 'dart:convert';
import 'dart:typed_data';
import 'package:chat/custom/text_chat.dart';
import 'package:dart_des/dart_des.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class Des {
  Des._();

  static String key = '12345678';
  static String keyImage = 'apmwfnmdfxiwnc==pnekxhrnssjf===';

  static String encrypted(String text) {
    List<int> encrypted;
    DES desECB = DES(key: key.codeUnits, mode: DESMode.ECB);
    encrypted = desECB.encrypt(text.codeUnits);
    return base64.encode(encrypted);
  }

  static Future<String> encryptedImage(XFile image) async {
    Uint8List data = await image.readAsBytes();
    String text = base64.encode(data);
    String textEncrypted = text.substring(0, 20);
    String textNotEncrypted = text.substring(20, text.length);
    return '${Des.encrypted(textEncrypted)}${Des.keyImage}$textNotEncrypted';
  }

  static String decryptedText(String text) {
    List<int> decrypted;
    DES desECB = DES(key: key.codeUnits, mode: DESMode.ECB);
    decrypted = desECB.decrypt(base64.decode(text));
    return utf8.decode(decrypted);
  }

  static Widget decrypted(String text, BuildContext context) {
    List<String> data = text.split(Des.keyImage);
    if (data.length > 1) {
      String dataImage = '${Des.decryptedText(data[0])}${data[1]}';
      return Image.memory(
        base64.decode(dataImage),
      );
    } else {
      return TextX.chat(Des.decryptedText(text), context);
    }
  }
}
