import 'package:ai_chatbot_ui/widgets/appbar_widget.dart';
import 'package:ai_chatbot_ui/widgets/navigation_bar_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/ai_bot_display.dart';
import '../widgets/chat_input.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
          context: context,
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NavigationBarScreen(),
              ))),
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: AIBotDisplay(),
            ),
          ),
          const ChatInput(),
        ],
      ),
    );
  }
}
