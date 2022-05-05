import 'package:chat/screen/login/login_screen.dart';
import 'package:chat/screen/profile/component/inforRow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProFile extends StatelessWidget {
  const ProFile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 75,
          ),
          Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.grey),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Võ Phi Quân',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 4,
          ),
          const InforRow(
            title: 'Thông tin tài khoản',
          ),
          const InforRow(
            title: 'Cài đặt',
          ),
          InforRow(
            title: 'Đăng xuất',
            onTap: () {
              Get.to(() => const LoginScreen());
            },
          ),
        ],
      ),
    );
  }
}
