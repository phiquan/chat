import 'package:chat/custom/text_chat.dart';
import 'package:chat/custom/waiting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class WebWiew extends StatefulWidget {
  final String url;

  const WebWiew({Key key, @required this.url}) : super(key: key);

  @override
  State<WebWiew> createState() => _WebWiewState();
}

class _WebWiewState extends State<WebWiew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.url,
          style: const TextStyle(color: Colors.grey),
        ),
        titleSpacing: 0,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Icon(Icons.arrow_back_ios, color: Colors.grey),
          ),
        ),
      ),
      body: SafeArea(
        child: InAppWebView(
          initialUrlRequest:
              URLRequest(url: Uri.parse(TextX.convertHttps(widget.url))),
          onLoadStart: (_, __) => Waiting.showWaiting(),
          onLoadStop: (_, __) => Waiting.hideWaiting(),
        ),
      ),
    );
  }
}
