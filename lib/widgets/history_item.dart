import 'package:ai_chatbot_ui/screens/chat_response_screen.dart';
import 'package:flutter/material.dart';

class HistoryItem extends StatelessWidget {
  final String text;

  const HistoryItem({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ChatResponseScreen(),
      )),
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Icon(Icons.chat_outlined),
            const SizedBox(width: 12),
            Expanded(
              child: Text(text),
            ),
            const Icon(Icons.arrow_forward, size: 16),
          ],
        ),
      ),
    );
  }
}
