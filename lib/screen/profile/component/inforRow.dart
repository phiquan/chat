
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
class InforRow extends StatelessWidget {
  final Icon icon;
  final String title;
  final Function onTap;
  final Widget suffix;
  const InforRow({Key key, this.icon, this.title, this.onTap, this.suffix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if (kDebugMode) {
          print('onTap infoRow');
        }
        onTap();
      },
      child: Card(
        child: SizedBox(
          width: Get.width - 20,
          height: 65,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: icon,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      title ?? 'title',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                suffix ?? const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
