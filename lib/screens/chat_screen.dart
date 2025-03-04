// import 'package:ai_chatbot_ui/models/message.dart';
// import 'package:ai_chatbot_ui/services/chat_service.dart';
// import 'package:ai_chatbot_ui/widgets/appbar_widget.dart';
// import 'package:ai_chatbot_ui/widgets/chat_bubble.dart';
// import 'package:ai_chatbot_ui/widgets/chat_input.dart';
// import 'package:ai_chatbot_ui/widgets/navigation_bar_screen.dart';
// import 'package:flutter/material.dart';

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final List<Message> messages = [];
//   bool isGenerating = false;
//   final ScrollController _scrollController = ScrollController();
//   final ChatService _chatService = ChatService();

//   void _scrollToBottom() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (_scrollController.hasClients) {
//         _scrollController.animateTo(
//           _scrollController.position.maxScrollExtent,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeOut,
//         );
//       }
//     });
//   }

//   void _handleMessageSent(String userMessage) async {
//     setState(() {
//       messages.add(Message(text: userMessage, isUser: true));
//       messages.add(Message(text: "", isUser: false, isComplete: false));
//       isGenerating = true;
//     });
//     _scrollToBottom();

//     try {
//       await for (final chunk in _chatService.streamResponse(userMessage)) {
//         setState(() {
//           messages.last = Message(
//             text: chunk,
//             isUser: false,
//             isComplete: false,
//           );
//         });
//         _scrollToBottom();
//       }

//       setState(() {
//         messages.last = Message(
//           text: messages.last.text,
//           isUser: false,
//           isComplete: true,
//         );
//         isGenerating = false;
//       });
//     } catch (e) {
//       setState(() {
//         messages.last = Message(
//           text: "Une erreur s'est produite. Veuillez réessayer.",
//           isUser: false,
//           isComplete: true,
//         );
//         isGenerating = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: appBarWidget(
//         context: context,
//         onPressed: () => Navigator.of(context).push(MaterialPageRoute(
//           builder: (context) => NavigationBarScreen(),
//         )),
//       ),
//       // AppBar(
//       //   title: const Text('Chat'),
//       //   backgroundColor: Colors.grey[900],
//       // ),
//       backgroundColor: Colors.black,
//       body: Column(
//         children: [
//           Expanded(
//             child: messages.isEmpty
//                 ? const Center(
//                     child: Text(
//                       'Commencez une conversation...',
//                       style: TextStyle(color: Colors.white70),
//                     ),
//                   )
//                 : ListView.builder(
//                     controller: _scrollController,
//                     itemCount: messages.length,
//                     padding: const EdgeInsets.all(16),
//                     itemBuilder: (context, index) {
//                       return ChatBubble(
//                         key:
//                             ValueKey('${index}_${messages[index].text.length}'),
//                         text: messages[index].text,
//                         isUser: messages[index].isUser,
//                         hasImage: messages[index].hasImage,
//                         isComplete: messages[index].isComplete,
//                       );
//                     },
//                   ),
//           ),
//           ChatInput(
//             onMessageSent: _handleMessageSent,
//             isGenerating: isGenerating,
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
// }

// import 'package:ai_chatbot_ui/models/message.dart';
// import 'package:ai_chatbot_ui/services/chat_service.dart';
// import 'package:ai_chatbot_ui/widgets/chat_bubble.dart';
// import 'package:ai_chatbot_ui/widgets/chat_input.dart';
// import 'package:ai_chatbot_ui/widgets/image_picker_dialog_widget.dart';
// import 'package:flutter/material.dart';

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final List<Message> messages = [];
//   bool isGenerating = false;
//   final ScrollController _scrollController = ScrollController();
//   final ChatService _chatService = ChatService();

//   void _scrollToBottom() {
//     if (!_scrollController.hasClients) return;

//     final position = _scrollController.position;
//     final isScrolledToBottom = position.pixels == position.maxScrollExtent;
//     final isNearBottom = position.pixels >= position.maxScrollExtent - 100;

//     if (isScrolledToBottom ||
//         isNearBottom ||
//         messages.isNotEmpty && messages.last.isUser) {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         _scrollController.animateTo(
//           _scrollController.position.maxScrollExtent,
//           duration: const Duration(milliseconds: 100),
//           curve: Curves.easeOut,
//         );
//       });
//     }
//   }

//   void _handleMessageSent(
//       String userMessage, List<ImageAttachment> attachments) async {
//     // Don't send if there's no message and no attachments
//     if (userMessage.isEmpty && attachments.isEmpty) return;

//     setState(() {
//       messages.add(Message(
//         text: userMessage,
//         isUser: true,
//         attachments: attachments,
//       ));
//       messages.add(Message(
//         text: "",
//         isUser: false,
//         isComplete: false,
//       ));
//       isGenerating = true;
//     });
//     _scrollToBottom();

//     try {
//       await for (final chunk
//           in _chatService.streamResponse(userMessage, attachments)) {
//         setState(() {
//           messages.last = Message(
//             text: chunk,
//             isUser: false,
//             isComplete: false,
//           );
//         });
//         _scrollToBottom();
//       }

//       setState(() {
//         messages.last = Message(
//           text: messages.last.text,
//           isUser: false,
//           isComplete: true,
//         );
//         isGenerating = false;
//       });
//     } catch (e) {
//       print('Error generating response: $e');
//       setState(() {
//         messages.last = Message(
//           text: "Une erreur s'est produite. Veuillez réessayer.",
//           isUser: false,
//           isComplete: true,
//         );
//         isGenerating = false;
//       });

//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Erreur lors de la génération de la réponse'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Chat'),
//         backgroundColor: Colors.black,
//         actions: [
//           // Add settings or other actions here
//           IconButton(
//             icon: const Icon(Icons.refresh),
//             onPressed: isGenerating
//                 ? null
//                 : () {
//                     setState(() {
//                       messages.clear();
//                     });
//                   },
//           ),
//         ],
//       ),
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: messages.isEmpty
//                   ? Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.chat_bubble_outline,
//                             size: 48,
//                             color: Colors.grey[700],
//                           ),
//                           const SizedBox(height: 16),
//                           Text(
//                             'Commencez une conversation...',
//                             style: TextStyle(
//                               color: Colors.grey[700],
//                               fontSize: 16,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           Text(
//                             'Envoyez un message ou partagez une image',
//                             style: TextStyle(
//                               color: Colors.grey[600],
//                               fontSize: 14,
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   : GestureDetector(
//                       onTap: () => FocusScope.of(context).unfocus(),
//                       child: ListView.builder(
//                         controller: _scrollController,
//                         padding: const EdgeInsets.all(16),
//                         itemCount: messages.length,
//                         itemBuilder: (context, index) {
//                           final message = messages[index];
//                           return ChatBubble(
//                             key: ValueKey('${index}_${message.text.length}'),
//                             text: message.text,
//                             isUser: message.isUser,
//                             attachments: message.attachments,
//                             isComplete: message.isComplete,
//                           );
//                         },
//                       ),
//                     ),
//             ),
//             ChatInput(
//               onMessageSent: _handleMessageSent,
//               isGenerating: isGenerating,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
// }

// // Add this widget for image preview
// class ImagePreview extends StatelessWidget {
//   final ImageAttachment attachment;
//   final VoidCallback onRemove;

//   const ImagePreview({
//     super.key,
//     required this.attachment,
//     required this.onRemove,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           margin: const EdgeInsets.only(right: 8),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             border: Border.all(color: Colors.grey[700]!),
//           ),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(8),
//             child: Image.file(
//               attachment.file,
//               height: 100,
//               width: 100,
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         Positioned(
//           top: 4,
//           right: 12,
//           child: GestureDetector(
//             onTap: onRemove,
//             child: Container(
//               padding: const EdgeInsets.all(4),
//               decoration: const BoxDecoration(
//                 color: Colors.black54,
//                 shape: BoxShape.circle,
//               ),
//               child: const Icon(
//                 Icons.close,
//                 size: 16,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//         if (attachment.description.isNotEmpty)
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 8,
//             child: Container(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 8,
//                 vertical: 4,
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.black54,
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(8),
//                   bottomRight: Radius.circular(8),
//                 ),
//               ),
//               child: Text(
//                 attachment.description,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 12,
//                 ),
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }

// ? Cancel button
import 'package:ai_chatbot_ui/models/message.dart';
import 'package:ai_chatbot_ui/services/chat_service.dart';
import 'package:ai_chatbot_ui/widgets/chat_bubble.dart';
import 'package:ai_chatbot_ui/widgets/chat_input.dart';
import 'package:ai_chatbot_ui/widgets/image_picker_dialog_widget.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> messages = [];
  bool isGenerating = false;
  final ScrollController _scrollController = ScrollController();
  final ChatService _chatService = ChatService();

  void _scrollToBottom() {
    if (!_scrollController.hasClients) return;

    final position = _scrollController.position;
    final isScrolledToBottom = position.pixels == position.maxScrollExtent;
    final isNearBottom = position.pixels >= position.maxScrollExtent - 100;

    if (isScrolledToBottom ||
        isNearBottom ||
        messages.isNotEmpty && messages.last.isUser) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeOut,
        );
      });
    }
  }

  void _stopGeneration() {
    _chatService.cancelGeneration();
    setState(() {
      isGenerating = false;
      if (messages.isNotEmpty) {
        messages.last = Message(
          text: messages.last.text,
          isUser: false,
          isComplete: true,
        );
      }
    });
  }

  void _handleMessageSent(
      String userMessage, List<ImageAttachment> attachments) async {
    if (userMessage.isEmpty && attachments.isEmpty) return;

    setState(() {
      messages.add(Message(
        text: userMessage,
        isUser: true,
        attachments: attachments,
      ));
      messages.add(Message(
        text: "",
        isUser: false,
        isComplete: false,
      ));
      isGenerating = true;
    });
    _scrollToBottom();

    try {
      await for (final chunk
          in _chatService.streamResponse(userMessage, attachments)) {
        setState(() {
          messages.last = Message(
            text: chunk,
            isUser: false,
            isComplete: false,
          );
        });
        _scrollToBottom();
      }

      setState(() {
        messages.last = Message(
          text: messages.last.text,
          isUser: false,
          isComplete: true,
        );
        isGenerating = false;
      });
    } catch (e) {
      print('Error generating response: $e');
      setState(() {
        messages.last = Message(
          text: "Une erreur s'est produite. Veuillez réessayer.",
          isUser: false,
          isComplete: true,
        );
        isGenerating = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Erreur lors de la génération de la réponse'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: isGenerating
                ? null
                : () {
                    setState(() {
                      messages.clear();
                    });
                  },
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: messages.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.chat_bubble_outline,
                            size: 48,
                            color: Colors.grey[700],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Commencez une conversation...',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Envoyez un message ou partagez une image',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    )
                  : GestureDetector(
                      onTap: () => FocusScope.of(context).unfocus(),
                      child: ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(16),
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final message = messages[index];
                          return ChatBubble(
                            key: ValueKey('${index}_${message.text.length}'),
                            text: message.text,
                            isUser: message.isUser,
                            attachments: message.attachments,
                            isComplete: message.isComplete,
                          );
                        },
                      ),
                    ),
            ),
            ChatInput(
              onMessageSent: _handleMessageSent,
              isGenerating: isGenerating,
              onStopGeneration: _stopGeneration,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
