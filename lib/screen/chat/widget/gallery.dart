import 'dart:io';

import 'package:chat/controller/chatMessage_Controller.dart';
import 'package:chat/screen/chat/widget/zoom_images.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class Gallery extends StatefulWidget {
  final int idConversation;
  final double heightPicker;
  final String nameUser;
  final ScrollController scrollControllerPicker;
  final int userID;

  const Gallery(
      {Key key,
      this.nameUser,
      this.idConversation,
      this.heightPicker,
      this.scrollControllerPicker,
      this.userID})
      : super(key: key);

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  List<AssetEntity> assets = [];

  final ChatMessagerController chatMessageController =
      Get.put(ChatMessagerController());

  @override
  void initState() {
    _fetchAssets();
    super.initState();
  }

  _fetchAssets() async {
    final albums = await PhotoManager.getAssetPathList(onlyAll: true);
    final recentAlbum = albums.first;
    final recentAssets = await recentAlbum.getAssetListRange(
      start: 0, // start at index 0
      end: 1000000, // end at a very big index (to get all the assets)
    );

    setState(() => assets = recentAssets);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (chatMessageController.imageSelected.isNotEmpty) {
              for (var item in chatMessageController.imageSelected) {
                chatMessageController.images.add(File(item));
              }
              chatMessageController.setImageChat(chatMessageController.images);

              // chatMessageController.addHinhAnh(
              //     widget.idConversation, widget.userID);
              // chatMessageController.setImageChat(null);

              if (widget.heightPicker == null) {
                Get.back();
              }
            } else {
              if (kDebugMode) {
                print("Chọn hình");
              }
            }
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              GetBuilder<ChatMessagerController>(
                  init: ChatMessagerController(),
                  builder: (ChatMessagerController controller) {
                    return Icon(
                      Icons.send,
                      size: 30.0,
                      color: chatMessageController.imageSelected.isNotEmpty
                          ? Colors.blue
                          : Colors.blue[100],
                    );
                  }),
              Positioned(
                right: -10,
                top: -20,
                child: GetBuilder<ChatMessagerController>(
                    init: ChatMessagerController(),
                    builder: (ChatMessagerController controller) {
                      return Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: controller.imageSelected.isNotEmpty
                                ? Colors.blue
                                : Colors.transparent),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(
                            child: Text(
                                controller.imageSelected.length.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
          backgroundColor: Colors.white,
        ),
        appBar: widget.heightPicker == null
            ? AppBar(
                backgroundColor: Colors.white,
                leading: InkWell(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    Get.back();
                  },
                  child: const Icon(
                    Icons.clear,
                    color: Colors.black,
                    size: 25.0,
                  ),
                ),
                centerTitle: true,
                title: Text(
                  "Gửi cho " + widget.nameUser,
                  style: const TextStyle(color: Colors.grey, fontSize: 14.0),
                ))
            : null,
        body: Column(
          children: [
            Container(
              height: widget.heightPicker,
              child: Expanded(
                child: GridView.builder(
                    controller: widget.scrollControllerPicker,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1),
                    itemCount: assets.length,
                    itemBuilder: (_, index) {
                      return FutureBuilder<File>(
                        future: assets[index].file,
                        builder: (_, snapshot) {
                          final fileData = snapshot.data;

                          if (fileData == null) {
                            return Container(
                              color: Colors.grey,
                            );
                          }
                          return GetBuilder<ChatMessagerController>(
                              init: ChatMessagerController(),
                              builder: (ChatMessagerController controller) {

                                return Stack(children: [
                                  Positioned.fill(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ZoomImage(
                                                    image: null,
                                                    indexImage:
                                                        fileData.path.hashCode,
                                                    nameUser: 'name user',
                                                    imageFile: fileData,
                                                    idConversationChat:
                                                        widget.idConversation,
                                                    idPhanLoai: 2,
                                                    userID: widget.userID,
                                                  )),
                                        ).then((value) => setState(() {}));
                                      },
                                      child: controller.imageSelected
                                                  .contains(fileData.path) ==
                                              true
                                          ? Image.file(
                                              fileData,
                                              color: Colors.white10
                                                  .withOpacity(0.5),
                                              fit: BoxFit.cover,
                                              colorBlendMode:
                                                  BlendMode.modulate,
                                            )
                                          : Image.file(
                                              fileData,
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 5,
                                    top: 5,
                                    child: InkWell(
                                      // ignore: void_checks
                                      onTap: () async {
                                        if (kDebugMode) {
                                          print("hello");
                                        }

                                        if (assets[index].type ==
                                            AssetType.image) {
                                          chatMessageController
                                              .updateImagePath(fileData.path);

                                          if (chatMessageController
                                                  .imageSelected
                                                  .contains(
                                                      chatMessageController
                                                          .image) ==
                                              false) {
                                            chatMessageController.imageSelected
                                                .add(chatMessageController
                                                    .image);
                                          } else {
                                            chatMessageController.imageSelected
                                                .remove(chatMessageController
                                                    .image);
                                          }
                                        } else {
                                          return 0;
                                        }
                                      },
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: controller.imageSelected
                                                            .contains(fileData
                                                                .path) ==
                                                        true
                                                    ? Colors.transparent
                                                    : Colors.white,
                                                width: 2),
                                            color: controller.imageSelected
                                                        .contains(
                                                            fileData.path) ==
                                                    true
                                                ? Colors.blue
                                                : Colors.black38),
                                        child: Center(
                                          child: Text(
                                            (controller.imageSelected.indexOf(
                                                        fileData.path) +
                                                    1)
                                                .toString(),
                                            style: TextStyle(
                                                color: controller.imageSelected
                                                            .contains(fileData
                                                                .path) ==
                                                        true
                                                    ? Colors.white
                                                    : Colors.transparent),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]);
                              });
                        },
                      );
                    }),
              ),
            ),
          ],
        ));
  }
}
