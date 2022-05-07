import 'dart:io';

import 'package:get/get.dart';

class ChatMessagerController extends GetxController{
  List<String> imageSelected = [];
  List<File> images = [];
  List<File> imageChat = [];
  String image = '';

  setImageChat(List<File> listImage) {
    imageChat = listImage;
    imageSelected = [];
    images = [];
    update();
  }

  updateImagePath(String imagePath) {
    image = imagePath;
    update();
  }
}