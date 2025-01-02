import 'package:animate_do/animate_do.dart';
import 'package:ai_chatbot_ui/screens/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpeakToAIPage extends StatelessWidget {
  const SpeakToAIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speaking to AI Bot'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ZoomIn(
            duration: const Duration(milliseconds: 600),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Image.asset(
                'assets/icons/robot-speak.png',
                height: 400,
              ),
            ),
          ),
          FadeInUp(
            duration: const Duration(milliseconds: 800),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text.rich(
                style: const TextStyle(fontSize: 22),
                TextSpan(
                  text: "Describe and show me the perfect vacation spot",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: " on an online in the ocean",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FadeInLeft(
              duration: const Duration(milliseconds: 700),
              child: SizedBox(
                width: 55,
                height: 55,
                child: IconButton.filledTonal(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(),
                    ),
                  ),
                  icon: const Icon(Icons.chat_outlined),
                  style: IconButton.styleFrom(
                    backgroundColor: const Color(0xff313638),
                  ),
                  color: Colors.white,
                ),
              ),
            ),
            Pulse(
              infinite: true,
              duration: const Duration(milliseconds: 1500),
              child: Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff232729),
                      spreadRadius: 20,
                    ),
                  ],
                ),
                child: IconButton.filledTonal(
                  onPressed: () {},
                  iconSize: 40,
                  icon: const Icon(CupertinoIcons.mic),
                  style: IconButton.styleFrom(
                    backgroundColor: const Color(0xff313638),
                  ),
                  color: Colors.white,
                ),
              ),
            ),
            FadeInRight(
              duration: const Duration(milliseconds: 700),
              child: SizedBox(
                width: 55,
                height: 55,
                child: IconButton.filledTonal(
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz),
                  style: IconButton.styleFrom(
                    backgroundColor: const Color(0xff313638),
                  ),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
