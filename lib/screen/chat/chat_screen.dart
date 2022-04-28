import 'package:chat/screen/chat/widget/list_user.dart';
import 'package:chat/screen/chat/widget/user_onl.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            title(),
            const UserOnline(),
            const ListUser(),
          ],
        ),
      ),
    );
  }

  Widget title() {
    return const Text(
      'Chat Encrypted',
      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
    );
  }
}
