// import 'dart:developer';
// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
//
// class QRCodeScreen extends StatefulWidget {
//   const QRCodeScreen({Key key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() => _QRCodeScreenState();
// }
//
// class _QRCodeScreenState extends State<QRCodeScreen> {
//   Barcode result;
//   QRViewController controller;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//
//   @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller.pauseCamera();
//     }
//     controller.resumeCamera();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: <Widget>[
//             _buildQrView(context),
//             Positioned(
//               top: 12,
//               left: 8,
//               child: IconButton(
//                 onPressed: () => Get.back(),
//                 icon: const Icon(
//                   Icons.arrow_back_ios,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 12,
//               right: 8,
//               child: IconButton(
//                 onPressed: () async => await controller.flipCamera(),
//                 icon: const Icon(
//                   Icons.camera,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildQrView(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     var scanArea = (size.width < 400 || size.height < 400) ? 300.0 : 400.0;
//     return QRView(
//       key: qrKey,
//       onQRViewCreated: _onQRViewCreated,
//       overlay: QrScannerOverlayShape(
//         borderColor: Colors.blue,
//         borderRadius: 10,
//         borderLength: 30,
//         borderWidth: 10,
//         cutOutSize: scanArea,
//       ),
//       onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
//     );
//   }
//
//   void _onQRViewCreated(QRViewController controller) {
//     setState(() {
//       this.controller = controller;
//     });
//     controller.scannedDataStream.listen((scanData) async {
//       controller.stopCamera();
//       if (kDebugMode) {
//         print('check sđt để kết bạn nè');
//       }
//       Get.dialog(Dialog(
//         backgroundColor: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 16),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 'Thông báo',
//                 style: TextStyle(
//                   color: Colors.indigo[900],
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Text(scanData.code,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.normal,
//                     fontSize: 14,
//                   )),
//               const SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Get.back();
//                       Get.back();
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Colors.orange),
//                       child: const Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 32.0, vertical: 8.0),
//                         child: Text(
//                           'Đóng',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ));
//     });
//   }
//
//   void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
//     log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
//     if (!p) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text(
//             'Bạn chưa cấp quyền máy ảnh',
//           ),
//         ),
//       );
//     }
//   }
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
// }
