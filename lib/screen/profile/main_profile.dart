import 'package:chat/Common/color.dart';
import 'package:chat/Common/firestore_constants.dart';
import 'package:chat/Common/vertical.dart';
import 'package:chat/controller/auth.dart';
import 'package:chat/controller/profile_controller.dart';
import 'package:chat/local/get_local.dart';
import 'package:chat/local/set_local.dart';
import 'package:chat/screen/login/login_page.dart';
import 'package:chat/screen/profile/component/inforRow.dart';
import 'package:chat/screen/profile/thong_tin_tai_khoan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProFile extends StatefulWidget {
  const ProFile({Key key}) : super(key: key);

  @override
  State<ProFile> createState() => _ProFileState();
}

class _ProFileState extends State<ProFile> {
  AuthProvider authProvider;
  ProfileProvider profileProvider;
  bool checkSwitch = false;
  String name = '';
  String photoUrl = '';

  @override
  void initState() {
    super.initState();
    authProvider = context.read<AuthProvider>();
    profileProvider = context.read<ProfileProvider>();
    checkSwitchFingerprint();
    readLocal();
  }

  Future checkSwitchFingerprint() async {
    bool temp = await GetLocal.getSwitchFingerprint();
    setState(() {
      checkSwitch = temp;
    });
  }

  void readLocal() {
    setState(() {
      name = profileProvider.getPrefs(FirestoreConstants.displayName) ?? "";
      photoUrl = profileProvider.getPrefs(FirestoreConstants.photoUrl) ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    readLocal();
    return Center(
      child: Column(
        children: [
          vertical70,
          _avatar(),
          Text(
            name,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          vertical30,
          InforRow(
            title: 'Thông tin tài khoản',
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()));
            },
            icon: const Icon(Icons.person_rounded),
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
            icon: const Icon(Icons.fingerprint),
          ),
          InforRow(
            title: 'Đăng xuất',
            onTap: () {
              googleSignOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }

  Future<void> googleSignOut() async {
    authProvider.googleSignOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  Widget _avatar() {
    return Container(
      alignment: Alignment.center,
      child: photoUrl.isNotEmpty
          ? ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.network(
                photoUrl,
                fit: BoxFit.cover,
                width: 120,
                height: 120,
                errorBuilder: (context, object, stackTrace) {
                  return const Icon(
                    Icons.account_circle,
                    size: 90,
                    color: AppColors.greyColor,
                  );
                },
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return SizedBox(
                    width: 90,
                    height: 90,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.grey,
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes
                            : null,
                      ),
                    ),
                  );
                },
              ),
            )
          : const Icon(
              Icons.account_circle,
              size: 90,
              color: AppColors.greyColor,
            ),
      margin: const EdgeInsets.all(20),
    );
  }
}
