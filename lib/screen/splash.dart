import 'package:chat/controller/auth.dart';
import 'package:chat/local/get_local.dart';
import 'package:chat/screen/login/login_page.dart';
import 'package:chat/screen/login/security.dart';
import 'package:chat/screen/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      checkSignedIn();
    });
  }

  void checkSignedIn() async {
    AuthProvider authProvider = context.read<AuthProvider>();
    bool isLoggedIn = await authProvider.isLoggedIn();
    bool checkSwitchFingerprint = await GetLocal.getSwitchFingerprint();
    if (isLoggedIn) {
      if (checkSwitchFingerprint) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const FingerPrintAuth()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const BodyNavigationBar()));
        return;
      }
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 300,
              height: 300,
            ),
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator(
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
