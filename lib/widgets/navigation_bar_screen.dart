import 'package:ai_chatbot_ui/screens/account_screen.dart';
import 'package:ai_chatbot_ui/screens/chat_screen.dart';
import 'package:ai_chatbot_ui/screens/folder_screen.dart';
import 'package:ai_chatbot_ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int currentIndex = 0;
  List<Widget> pages = [
    HomeScreen(),
    ChatScreen(),
    FolderScreen(),
    AccountScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(color: Colors.white),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        unselectedItemColor: Colors.grey,
        // backgroundColor: Colors.black,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline), label: "Chats"),
          BottomNavigationBarItem(
              icon: Icon(Icons.folder_outlined), label: "Folders"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Account"),
          // BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
    );
  }
}
