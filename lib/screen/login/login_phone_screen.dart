// import 'package:chat/screen/navigation.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// class LoginPhoneScreen extends StatefulWidget {
//   const LoginPhoneScreen({Key key}) : super(key: key);
//
//   @override
//   _LoginPhoneScreenState createState() => _LoginPhoneScreenState();
// }
//
// class _LoginPhoneScreenState extends State<LoginPhoneScreen> {
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController otpController = TextEditingController();
//
//   FirebaseAuth auth = FirebaseAuth.instance;
//
//   bool otpVisibility = false;
//
//   String verificationID = "";
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Phone Auth",
//           style: TextStyle(
//             fontSize: 30,
//           ),
//         ),
//         backgroundColor: Colors.indigo[900],
//       ),
//       body: Container(
//         margin: const EdgeInsets.all(10),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: phoneController,
//               decoration: const InputDecoration(
//                 hintText: 'Phone Number',
//                 prefix: Padding(
//                   padding: EdgeInsets.all(4),
//                   child: Text('+91'),
//                 ),
//               ),
//               maxLength: 10,
//               keyboardType: TextInputType.phone,
//             ),
//             Visibility(
//               child: TextField(
//                 controller: otpController,
//                 decoration: const InputDecoration(
//                   hintText: 'OTP',
//                   prefix: Padding(
//                     padding: EdgeInsets.all(4),
//                     child: Text(''),
//                   ),
//                 ),
//                 maxLength: 6,
//                 keyboardType: TextInputType.number,
//               ),
//               visible: otpVisibility,
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             MaterialButton(
//               color: Colors.indigo[900],
//               onPressed: () {
//                 if (otpVisibility) {
//                   verifyOTP();
//                 } else {
//                   loginWithPhone();
//                 }
//               },
//               child: Text(
//                 otpVisibility ? "Verify" : "Login",
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void loginWithPhone() async {
//     auth.verifyPhoneNumber(
//       phoneNumber: "+84" + phoneController.text,
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         await auth.signInWithCredential(credential).then((value) {
//           if (kDebugMode) {
//             print("You are logged in successfully");
//           }
//         });
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         if (kDebugMode) {
//           print(e.message);
//         }
//       },
//       codeSent: (String verificationId, int resendToken) {
//         otpVisibility = true;
//         verificationID = verificationId;
//         setState(() {});
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {},
//     );
//   }
//
//   void verifyOTP() async {
//     PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: verificationID, smsCode: otpController.text);
//
//     await auth.signInWithCredential(credential).then(
//           (value) {
//         if (kDebugMode) {
//           print("You are logged in successfully");
//         }
//         Fluttertoast.showToast(
//           msg: "You are logged in successfully",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.CENTER,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0,
//         );
//       },
//     ).whenComplete(
//           () {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const BodyNavigationBar(),
//           ),
//         );
//       },
//     );
//   }
// }