import 'dart:convert';
import 'dart:typed_data';
import 'package:chat/encrypted/des.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class DesImage {

  DesImage._();

  static String key = 'apmwfnmdfxiwnc==';

  static Future<String> encrypted(XFile image) async {
    Uint8List data = await image.readAsBytes();
    String text = base64.encode(data);
    return '${DesImage.key}$text';
  } 

  // static Image decrypted(String text) {
  //   Uint8List data = base64.decode(Des.decrypted(text));
  //   return Image.memory(
  //     data,
  //     fit: BoxFit.cover,
  //   );
  // }
}
