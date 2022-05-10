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
      appBar: _appBar(),
      body: SafeArea(
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
          onLoadStart: (controller, url) {
            Waiting.showWatting();
          },
          onLoadStop: (controller, url) {
            Waiting.hideWatting();
          },
        ),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 5),
          SizedBox(
            width: Get.width - 70,
            child: Text(
              widget.url,
              style: const TextStyle(color: Colors.grey),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
