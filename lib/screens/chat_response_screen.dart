import 'package:ai_chatbot_ui/widgets/appbar_widget.dart';
import 'package:ai_chatbot_ui/widgets/chat_bubble.dart';
import 'package:ai_chatbot_ui/widgets/chat_input.dart';
import 'package:flutter/material.dart';

class ChatResponseScreen extends StatelessWidget {
  const ChatResponseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
          context: context, onPressed: () => Navigator.pop(context)),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const ChatBubble(
                  text:
                      'Describe and show me the perfect vacation spot on an island in the ocean',
                  isUser: true,
                ),
                const SizedBox(height: 16),
                const ChatBubble(
                  text:
                      'Imagine yourself on an idyllic island in the middle of the vast ocean, where turquoise waters and powdery white sand surround you. This perfect vacation spot is a tropical paradise that offers a blend of tranquility and adventure.',
                  isUser: false,
                  hasImage: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                const ChatBubble(
                  text: 'Thanks for the description ❤️',
                  isUser: true,
                ),
              ],
            ),
          ),
          const ChatInput(),
        ],
      ),
    );
  }
}
