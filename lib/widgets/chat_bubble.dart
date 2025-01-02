import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isUser;
  final bool hasImage;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isUser,
    this.hasImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          width: 300,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isUser ? Colors.blue.shade300 : Colors.grey[800],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (hasImage) ...[
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/island.jpg',
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
              Text(text),
            ],
          ),
        ),
        if (!isUser) ...[
          const SizedBox(height: 8),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.thumb_up_outlined),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.thumb_down_outlined),
                onPressed: () {},
              ),
              Spacer(),
              IconButton(
                icon: const Icon(Icons.copy),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ],
    );
  }
}
