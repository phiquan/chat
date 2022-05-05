import 'package:chat/screen/login/text_field.dart';
import 'package:chat/screen/navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String pass = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    'Đăng Nhập',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFieldCustom(
                    title: 'Nhập email',
                    validatorFunction: (value) {
                      if (value.isEmpty) {
                        return 'Vui lòng nhâp email';
                      } else if (!GetUtils.isEmail(value)) {
                        return 'Vui lòng nhập đúng email';
                      } else {
                        return null;
                      }
                    },
                    onChange: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFieldCustom(
                    title: 'Nhập mật khẩu',
                    validatorFunction: (value) {
                      if (value.isEmpty) {
                        return 'Vui lòng nhập mật khẩu';
                      } else {
                        return null;
                      }
                    },
                    onChange: (value) {
                      setState(() {
                        pass = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  _buttonLogin()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _dialogWarning() {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Thông Báo',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.indigo[900]),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Vui lòng nhập thông tin',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
                      child: Text(
                        'Đóng',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buttonLogin(){
    return GestureDetector(
      onTap: () {
        if (_formKey.currentState.validate()) {
          Get.to(() => const BodyNavigationBar());
        } else {
          Get.dialog(_dialogWarning());
        }
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.indigo[900],
              borderRadius: BorderRadius.circular(15)),
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Đăng nhập',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
