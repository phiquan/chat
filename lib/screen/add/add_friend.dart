import 'package:chat/screen/add/widget/qr_phone.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddFriend extends StatelessWidget {
  const AddFriend({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _searchPhone(),
          const SizedBox(height: 10),
          const Center(
            child: QrCodeWidget(data: '0898043575'),
          )
        ],
      ),
    );
  }

  Widget _searchPhone() {
    return Container(
      height: 50,
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                if (kDebugMode) {
                  print('Tìm bằng sđt');
                }
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 35,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Nhập số điên thoại',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                // Get.to(() => const QRCodeScreen());
              },
              child: const Icon(
                Icons.qr_code,
                size: 35,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
