// import 'package:flutter/material.dart';

// class ChatBubble extends StatelessWidget {
//   final String text;
//   final bool isUser;
//   final bool hasImage;
//   final bool isComplete;

//   const ChatBubble({
//     super.key,
//     required this.text,
//     required this.isUser,
//     this.hasImage = false,
//     this.isComplete = true,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16),
//       child: Align(
//         alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
//         child: Container(
//           constraints: BoxConstraints(
//             maxWidth: MediaQuery.of(context).size.width * 0.75,
//           ),
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: isUser ? Colors.blue : Colors.grey[800],
//             borderRadius: BorderRadius.circular(16),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 spreadRadius: 1,
//                 blurRadius: 3,
//                 offset: const Offset(0, 1),
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               if (hasImage) ...[
//                 const SizedBox(height: 8),
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(8),
//                   child: Image.asset(
//                     'assets/images/island.jpg',
//                     width: double.infinity,
//                     height: 150,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ],
//               SelectableText(
//                 text + (isComplete ? '' : '▊'),
//                 style: TextStyle(
//                   fontSize: 16,
//                   height: 1.4,
//                   color: Colors.white,
//                 ),
//                 textAlign: TextAlign.left,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// ? Chat Bubble qui fonctionne End

import 'package:ai_chatbot_ui/widgets/image_picker_dialog_widget.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isUser;
  final List<ImageAttachment> attachments;
  final bool isComplete;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isUser,
    this.attachments = const [],
    this.isComplete = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Align(
        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75,
          ),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isUser ? Colors.blue : Colors.grey[800],
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (attachments.isNotEmpty) ...[
                for (var attachment in attachments) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      attachment.file,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (attachment.description.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      attachment.description,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                  const SizedBox(height: 16),
                ],
              ],
              SelectableText(
                text + (isComplete ? '' : '▊'),
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.4,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:ai_chatbot_ui/widgets/image_picker_dialog_widget.dart';

// class ChatBubble extends StatelessWidget {
//   final String text;
//   final bool isUser;
//   final List<ImageAttachment> attachments;
//   final bool isComplete;

//   const ChatBubble({
//     super.key,
//     required this.text,
//     required this.isUser,
//     this.attachments = const [],
//     this.isComplete = true,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16),
//       child: Align(
//         alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
//         child: Container(
//           constraints: BoxConstraints(
//             maxWidth: MediaQuery.of(context).size.width * 0.75,
//           ),
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: isUser ? const Color(0x88CFD8DC) : Colors.transparent,
//             borderRadius: BorderRadius.circular(16),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 spreadRadius: 1,
//                 blurRadius: 3,
//                 offset: const Offset(0, 1),
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Display attachments (images and descriptions)
//               if (attachments.isNotEmpty) ...[
//                 for (var attachment in attachments) ...[
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(12),
//                     child: AspectRatio(
//                       aspectRatio: 16 / 9, // Adjust the aspect ratio as needed
//                       child: Image.file(
//                         attachment.file,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   if (attachment.description.isNotEmpty) ...[
//                     const SizedBox(height: 8),
//                     Text(
//                       attachment.description,
//                       style: const TextStyle(
//                         color: Colors.white70,
//                         fontStyle: FontStyle.italic,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ],
//                   const SizedBox(height: 12),
//                 ],
//               ],
//               // Display the message text
//               SelectableText(
//                 text + (isComplete ? '' : '▊'),
//                 style: const TextStyle(
//                   fontSize: 16,
//                   height: 1.4,
//                   color: Colors.white,
//                 ),
//                 textAlign: TextAlign.left,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
