import 'package:chat/encrypted/des3.dart';
import 'package:chat/screen/chat/widget/gallery.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DetailChat extends StatefulWidget {
  const DetailChat({Key key}) : super(key: key);

  @override
  State<DetailChat> createState() => _DetailChatState();
}

class _DetailChatState extends State<DetailChat> {
  TextEditingController messageContentController = TextEditingController();
  var controllerScroll = ScrollController();
  String _lastedValueTextField = "";

  @override
  void initState() {
    super.initState();

    messageContentController.addListener(() {
      if (kDebugMode) {
        print("value: ${messageContentController.text}");
      }
      if (messageContentController.text == null ||
          messageContentController.text == "") {
        if (_lastedValueTextField != "") {
          setState(() {});
        }
      } else {
        if (_lastedValueTextField == "") {
          setState(() {});
        }
      }

      _lastedValueTextField = messageContentController.text;
    });
  }

  @override
  void dispose() {
    super.dispose();
    messageContentController.dispose();
    controllerScroll.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.indigo[900],
            ),
          ),
          title: _titleAppBar(),
        ),
        body: Stack(
          children: [
            _background(),
            Align(
              alignment: Alignment.bottomLeft,
              child: _send(),
            )
          ],
        ));
  }

  Widget _titleAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.grey),
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.indigo[900],
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                const Text(
                  'Đang hoạt động',
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: InkWell(
            onTap: () {
              if (kDebugMode) {
                print('onTap infor');
              }
            },
            child: const Icon(Icons.info_outline),
          ),
        ),
      ],
    );
  }

  Widget _background() {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
          color: Colors.grey,
          image: DecorationImage(
              image: AssetImage('assets/images/deltabackground.jpg'),
              fit: BoxFit.cover)),
    );
  }

  Widget _send() {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          messageContentController.text.isNotEmpty
              ? const Text("")
              : Row(
                  children: [
                    InkWell(
                        onTap: () async {
                          await chupAnh();
                        },
                        child: const Icon(
                          Icons.camera_alt,
                          size: 25,
                        )),
                    const SizedBox(width: 10),
                    InkWell(
                        onTap: () async {
                          Get.bottomSheet(DraggableScrollableSheet(
                            initialChildSize: 0.8,
                            minChildSize: 0.6,
                            maxChildSize: 0.8,
                            expand: false,
                            builder: (_, controller) {
                              return
                                  // Container(color: Colors.blue,);
                                  Gallery(
                                idConversation: 1,
                                heightPicker: null,
                                scrollControllerPicker: controller,
                                nameUser: 'quan',
                                userID: 1,
                              );
                            },
                          ));
                        },
                        child: const Icon(
                          Icons.photo,
                          size: 25,
                        )),
                  ],
                ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.black, // set border color
                      width: 1.0), // set border width
                  borderRadius: BorderRadius.circular(30.0)),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: TextField(
                  keyboardType: TextInputType.text,
                  maxLines: null,
                  onTap: () {
                    // print('onTap TextField');
                    //   chatController.scrollListMessage();
                  },
                  controller: messageContentController,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(
                        left: 5.0, right: 5.0, top: 10.0, bottom: 10.0),
                    hintText: 'Nhập tin nhắn',
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 14.0),
                    border: InputBorder.none,
                    fillColor: Colors.transparent,
                    filled: false,
                    isDense: true,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          InkWell(
            onTap: () {
              if (kDebugMode) {
                print(Des.encrypted(messageContentController.text));
                print('---------------');
                print(Des.decrypted(Des.encrypted(messageContentController.text)));
              }
              if (messageContentController.text != null &&
                  messageContentController.text != "") {
                messageContentController.clear();
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: messageContentController.text.isNotEmpty
                  ? const Icon(
                      Icons.send,
                      color: Colors.blue,
                      size: 25,
                    )
                  : const Icon(
                      Icons.send,
                      size: 25,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  final picker = ImagePicker();

  Future chupAnh() async {
    try {
      final pickedFile = await picker.pickImage(
        source: ImageSource.camera,
      );

      if (pickedFile == null) return;
      // var fileUpload = File(pickedFile.path);

    } catch (e) {
      Get.snackbar('Thông Báo', 'Chụp ảnh không thành công',
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.grey[200]);
    }
  }
}
