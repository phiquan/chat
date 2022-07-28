import 'dart:convert';
import 'dart:typed_data';
import 'package:chat/custom/text_chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:encrypt/encrypt.dart' as encry;

class Aes {
  Aes._();

  static String keyImage = 'apmwfnmdfxiwnc==pnekxhrnssjf===';

  static String encrypted(String text) {
    final key = encry.Key.fromUtf8('my 32 length key................');
    final iv = encry.IV.fromLength(16);
    final encrypter = encry.Encrypter(encry.AES(key));
    final encrypted = encrypter.encrypt(text, iv: iv);
    return encrypted.base64;
  }

  static Future<String> encryptedImage(XFile image) async {
    Uint8List data = await image.readAsBytes();
    String text = base64.encode(data);
    String textEncrypted = text.substring(0, 20);
    String textNotEncrypted = text.substring(20, text.length);
    return '${Aes.encrypted(textEncrypted)}${Aes.keyImage}$textNotEncrypted';
  }

  static String decryptedText(String text) {
    try {
      final key = encry.Key.fromUtf8('my 32 length key................');
      final iv = encry.IV.fromLength(16);
      final encrypter = encry.Encrypter(encry.AES(key));
      final decrypted =
          encrypter.decrypt(encry.Encrypted.fromBase64(text), iv: iv);
      return decrypted;
    } catch (e) {
      return text;
    }
  }

  static Widget decrypted(String text, BuildContext context) {
    List<String> data = text.split(Aes.keyImage);
    if (data.length > 1) {
      String dataImage = '${Aes.decryptedText(data[0])}${data[1]}';
      return Image.memory(
        base64.decode(dataImage),
      );
    } else {
      return TextX.chat(Aes.decryptedText(text), context);
    }
  }
}
