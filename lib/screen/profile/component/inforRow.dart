import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InforRow extends StatelessWidget {
  final String image;
  final String title;
  final Function onTap;

  const InforRow({Key key, this.image, this.title, this.onTap})
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
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.grey),
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
                const Icon(Icons.navigate_next)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
