import 'package:flutter/material.dart';

class UserOnline extends StatelessWidget {
  const UserOnline({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, __) => Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.grey,
                        ),
                      ),
                      Positioned(
                          bottom: 5,
                          right: 5,
                          child: Container(
                            width: 15,
                            height: 15,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ))
                    ],
                  ),
                  const Text('Name')
                ],
              ),
          separatorBuilder: (_, __) => const SizedBox(width: 15),
          itemCount: 10),
    );
  }
}
