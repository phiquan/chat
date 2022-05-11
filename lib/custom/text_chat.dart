import 'package:chat/screen/webView/web_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextX {
  static Widget chat(String text) {
    Map<String, bool> texts = {};
    RegExp exp = RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
    while (text.isNotEmpty) {
      RegExpMatch match = exp.firstMatch(text);
      if (match != null) {
        String first = text.substring(0, match.start);
        String link = text.substring(match.start, match.end);
        text = text.substring(match.end, text.length);
        texts.addAll({first: false, link: true});
      } else {
        texts.addAll({text: false});
        text = '';
      }
    }
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 32,
      ),
      child: RichText(
        text: TextSpan(
          children: texts.keys.map((e) {
            if (texts[e]) {
              return TextSpan(
                  text: e,
                  style: const TextStyle(color: Colors.blue,decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.to(() => WebWiew(url: e));
                    });
            } else {
              return TextSpan(text: e,style: const TextStyle(color: Colors.black));
            }
          }).toList(),
        ),
      ),
    );
  }

  static String convertHttps(String text){
    List<String> cutHttps = text.split('https://');
    String result;
    if (cutHttps.length == 2) {
      result = cutHttps[1];
    } else {
      result = cutHttps[0];
    }
    List<String> cutWWW = result.split('www.');
    if (cutWWW.length == 2) {
      result = cutWWW[1];
    } else {
      result = cutWWW[0];
    }
    return 'https://www.' + result;
  }
}
