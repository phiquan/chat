import 'dart:io';
import 'package:chat/controller/chatMessage_Controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ZoomImage extends StatefulWidget {
  final int indexImage;
  final String image;
  final String nameUser;
  final int idPhanLoai;
  final File imageFile;
  final bool onTapUser;
  final int idConversationChat;
  final int userID;

  const ZoomImage(
      {Key key,
      this.indexImage,
      this.image,
      this.idConversationChat,
      this.onTapUser,
      this.nameUser,
      this.idPhanLoai,
      this.imageFile,
      this.userID})
      : super(key: key);

  @override
  _ZoomImageState createState() => _ZoomImageState();
}

class _ZoomImageState extends State<ZoomImage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light));
  }

  bool checkOnTap = false;
  final ChatMessagerController chatMessagerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          setState(() {
            checkOnTap = !checkOnTap;
          });
        },
        child: Stack(
          children: [
            InteractiveViewer(
              child: Center(
                  child: Hero(
                transitionOnUserGestures: true,
                tag: widget.indexImage,
                child: Transform.scale(
                    scale: 1.0,
                    child: widget.idPhanLoai == 1
                        ? Image.network((widget.image))
                        : Image.file(widget.imageFile, fit: BoxFit.cover)),
              )),
            ),
            !checkOnTap
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black54,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 10,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_ios_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  widget.nameUser,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      decoration: TextDecoration.none,
                                      fontSize: 16.0),
                                )
                              ],
                            ),
                          ),
                        ),
                        widget.idPhanLoai == 2
                            ? Container(
                                color: Colors.black,
                                height: MediaQuery.of(context).size.height / 8,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30, right: 30),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (kDebugMode) {
                                            print("Hello");
                                          }
                                          setState(() {
                                            if (chatMessagerController
                                                    .imageSelected
                                                    .contains(widget
                                                        .imageFile.path) ==
                                                false) {
                                              chatMessagerController
                                                  .imageSelected
                                                  .add(widget.imageFile.path);
                                            } else {
                                              chatMessagerController
                                                  .imageSelected
                                                  .remove(
                                                      widget.imageFile.path);
                                            }
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            chatMessagerController.imageSelected
                                                        .contains(widget
                                                            .imageFile.path) ==
                                                    true
                                                ? const Icon(
                                                    Icons.check_circle_outlined,
                                                    color: Colors.blue,
                                                    size: 30.0,
                                                  )
                                                : const Icon(
                                                    Icons
                                                        .radio_button_unchecked_outlined,
                                                    color: Colors.white,
                                                    size: 30.0,
                                                  ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            const Text(
                                              "Chọn",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontSize: 16.0),
                                            )
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (chatMessagerController
                                                .imageSelected.isNotEmpty) {
                                              for (var item
                                                  in chatMessagerController
                                                      .imageSelected) {
                                                chatMessagerController.images
                                                    .add(File(item));
                                              }
                                              chatMessagerController
                                                  .setImageChat(
                                                      chatMessagerController
                                                          .images);
                                              // chatMessagerController.addHinhAnh(
                                              //     widget.idConversationChat,
                                              //     widget.userID);
                                              // chatMessagerController
                                              //     .setImageChat(null);
                                              Get.back();
                                              FocusScope.of(context).unfocus();
                                              Get.back();
                                            } else {
                                              if (kDebugMode) {
                                                print("Chọn hình");
                                              }
                                            }
                                          });
                                        },
                                        child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Container(
                                              width: 50,
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white),
                                              child: Icon(
                                                Icons.send,
                                                size: 30.0,
                                                color: chatMessagerController
                                                        .imageSelected
                                                        .isNotEmpty
                                                    ? Colors.blue
                                                    : Colors.blue[100],
                                              ),
                                            ),
                                            Positioned(
                                              right: 0,
                                              top: -5,
                                              child: Container(
                                                height: 20,
                                                width: 20,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.blue),
                                                child: Center(
                                                  child: Text(
                                                    chatMessagerController
                                                        .imageSelected.length
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12.0),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Container()
                      ],
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
