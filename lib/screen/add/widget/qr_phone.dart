import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeWidget extends StatelessWidget {
  final String data;
  final double size;
  final bool hasLogo;

  const QrCodeWidget({
    Key key,
    @required this.data,
    this.size = 200,
    this.hasLogo = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: QrImage(
        data: data,
        version: QrVersions.auto,
        size: size,
        gapless: false,
        embeddedImageStyle: QrEmbeddedImageStyle(
          size: const Size(100, 100),
        ),
        errorStateBuilder: (context, error) => const Text('Lỗi'),
        errorCorrectionLevel: QrErrorCorrectLevel.H,
      ),
    );
  }
}
