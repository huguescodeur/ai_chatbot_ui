// import 'package:flutter/material.dart';
// import '../models/message.dart';
// import '../widgets/appbar_widget.dart';
// import '../widgets/chat_bubble.dart';
// import '../widgets/chat_input.dart';
// import '../services/chat_service.dart';

// class ChatResponseScreen extends StatefulWidget {
//   const ChatResponseScreen({super.key});

//   @override
//   State<ChatResponseScreen> createState() => _ChatResponseScreenState();
// }

// class _ChatResponseScreenState extends State<ChatResponseScreen> {
//   final List<Message> messages = [];
//   bool isGenerating = false;
//   final ScrollController _scrollController = ScrollController();
//   final ChatService _chatService = ChatService();

//   @override
//   void initState() {
//     super.initState();
//   }

//   void _scrollToBottom() {
//     if (!_scrollController.hasClients) return;

//     final position = _scrollController.position;
//     final isScrolledToBottom = position.pixels == position.maxScrollExtent;
//     final isNearBottom = position.pixels >= position.maxScrollExtent - 100;

//     if (isScrolledToBottom || isNearBottom || messages.last.isUser) {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         _scrollController.animateTo(
//           _scrollController.position.maxScrollExtent,
//           duration: const Duration(milliseconds: 100),
//           curve: Curves.easeOut,
//         );
//       });
//     }
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
//       // Optionnel : Afficher une snackbar d'erreur
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
//       appBar: appBarWidget(
//         context: context,
//         onPressed: () => Navigator.pop(context),
//       ),
//       backgroundColor: Colors.black,
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               controller: _scrollController,
//               padding: const EdgeInsets.all(16),
//               itemCount: messages.length,
//               itemBuilder: (context, index) {
//                 final message = messages[index];
//                 return ChatBubble(
//                   key: ValueKey('${index}_${message.text.length}'),
//                   text: message.text,
//                   isUser: message.isUser,
//                   hasImage: message.hasImage,
//                   isComplete: message.isComplete,
//                 );
//               },
//             ),
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
