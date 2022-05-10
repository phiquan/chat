import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Waiting {
  static bool checkWaiting = false;

  static void showWatting() {
    if (checkWaiting) return;
    checkWaiting = true;
    showDialog(
      context: Get.overlayContext,
      barrierDismissible: false,
      builder: (ctx) => WillPopScope(
        onWillPop: () async => false,
        child: const Center(
          child: SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(
              strokeWidth: 5,
            ),
          ),
        ),
      ),
    );
  }

  static void hideWatting() {
    if (checkWaiting) {
      checkWaiting = false;
      Navigator.pop(Get.overlayContext);
    }
  }
}
