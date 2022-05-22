import 'package:chat/controller/auth_controller.dart';
import 'package:chat/local/get_local.dart';
import 'package:chat/local/set_local.dart';
import 'package:chat/screen/profile/component/inforRow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProFile extends StatefulWidget {
  const ProFile({Key key}) : super(key: key);

  @override
  State<ProFile> createState() => _ProFileState();
}

class _ProFileState extends State<ProFile> {
  bool checkSwitch = false;

  Future checkSwitchFingerprint() async {
    bool temp = await GetLocal.getSwitchFingerprint();
    setState(() {
      checkSwitch = temp;
    });
  }

  @override
  void initState() {
    super.initState();
    checkSwitchFingerprint();
  }

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
            title: 'Bật xác thực sinh trắc',
            suffix: CupertinoSwitch(
              value: checkSwitch,
              activeColor: Colors.blue,
              trackColor: Colors.grey,
              thumbColor: Colors.white,
              onChanged: (val) {
                setState(() {
                  checkSwitch = val;
                });
                SetLocal.setSwitchFingerprint(val);
              },
            ),
          ),
          InforRow(
            title: 'Đăng xuất',
            onTap: () {
              AuthController.instance.logout();
            },
          ),
        ],
      ),
    );
  }
}
