import 'package:chat/screen/chat/chat_screen.dart';
import 'package:chat/screen/profile/main_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List listCheck = [true, false, false];

class BodyNavigationBar extends StatefulWidget {
  const BodyNavigationBar({Key key}) : super(key: key);

  @override
  BodyNavigationBarState createState() => BodyNavigationBarState();
}

class BodyNavigationBarState extends State<BodyNavigationBar>
    with WidgetsBindingObserver {
  static int _selectedIndex = 0;
  static BodyNavigationBarState state;
  static bool check;

  BodyNavigationBarState() {
    state = this;
  }

  static void onItemTapped(int index) async {
    state.setState(() {
      BodyNavigationBarState._selectedIndex = index;
      listCheck[_selectedIndex] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            listCheck[0] ? const ChatScreen() : const SizedBox.shrink(),
            listCheck[1]
                ? Container(
                    color: Colors.red, height: Get.height, width: Get.width)
                : const SizedBox.shrink(),
            listCheck[2] ? const ProFile() : const SizedBox.shrink(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        selectedLabelStyle: TextStyle(
            color: Colors.lightBlue,
            fontSize: MediaQuery.of(context).size.width * 0.025,
            fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(
            color: Colors.indigo,
            fontSize: MediaQuery.of(context).size.width * 0.025,
            fontWeight: FontWeight.bold),
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          BodyNavigationBarState.onItemTapped(index);
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}
