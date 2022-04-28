import 'package:chat/screen/chat/widget/detail_chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListUser extends StatelessWidget {
  const ListUser({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (_, __) => InkWell(
                onTap: () {
                  Get.to(() => const DetailChat());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.grey),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Name'),
                        SizedBox(height: 5),
                        Text('Nội dung chat'),
                      ],
                    )
                  ],
                ),
              ),
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemCount: 20),
    );
  }
}
