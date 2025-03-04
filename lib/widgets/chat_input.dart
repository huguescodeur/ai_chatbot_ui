// import 'package:flutter/material.dart';

// class ChatInput extends StatefulWidget {
//   final Function(String) onMessageSent;
//   final bool isGenerating;

//   const ChatInput({
//     Key? key,
//     required this.onMessageSent,
//     required this.isGenerating,
//   }) : super(key: key);

//   @override
//   State<ChatInput> createState() => _ChatInputState();
// }

// class _ChatInputState extends State<ChatInput> {
//   final TextEditingController _controller = TextEditingController();

//   void _sendMessage() {
//     if (_controller.text.isEmpty || widget.isGenerating) return;
//     widget.onMessageSent(_controller.text);
//     _controller.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(10),
//       margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
//       decoration: BoxDecoration(
//         color: Colors.grey[900],
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Row(
//         children: [
//           IconButton(
//             icon: const Icon(Icons.attach_file),
//             onPressed: widget.isGenerating ? null : () {},
//             color: widget.isGenerating ? Colors.grey : Colors.white,
//           ),
//           Expanded(
//             child: TextField(
//               controller: _controller,
//               enabled: !widget.isGenerating,
//               maxLines: null,
//               style: const TextStyle(color: Colors.white),
//               textInputAction: TextInputAction.done,
//               decoration: InputDecoration(
//                 hintText: widget.isGenerating
//                     ? 'Waiting for response...'
//                     : 'Type your message...',
//                 hintStyle: TextStyle(
//                   color: Colors.grey[400],
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(24),
//                   borderSide: BorderSide.none,
//                 ),
//                 contentPadding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 8,
//                 ),
//               ),
//               onSubmitted: (_) => _sendMessage(),
//             ),
//           ),
//           IconButton(
//             icon: widget.isGenerating
//                 ? const SizedBox(
//                     width: 24,
//                     height: 24,
//                     child: CircularProgressIndicator(
//                       color: Colors.white,
//                       strokeWidth: 2,
//                     ),
//                   )
//                 : const Icon(Icons.send, color: Colors.white),
//             onPressed: widget.isGenerating ? null : _sendMessage,
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

// import 'package:flutter/material.dart';
// import '../services/chat_service.dart';

// class ChatInput extends StatefulWidget {
//   final Function(String) onMessageSent;
//   final bool isGenerating;

//   const ChatInput({
//     super.key,
//     required this.onMessageSent,
//     required this.isGenerating,
//   });

//   @override
//   State<ChatInput> createState() => _ChatInputState();
// }

// class _ChatInputState extends State<ChatInput> {
//   final TextEditingController _controller = TextEditingController();
//   final ChatService _chatService = ChatService();

//   Future<void> _sendMessage() async {
//     if (_controller.text.isEmpty) return;

//     print('Sending message: ${_controller.text}'); // Debug

//     final message = _controller.text;
//     widget.onMessageSent(message); // Affiche le message immédiatement
//     _controller.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(10),
//       margin: const EdgeInsets.only(left: 25, right: 25, top: 18, bottom: 18),
//       decoration: BoxDecoration(
//         color: Colors.grey[900],
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Row(
//         children: [
//           IconButton(
//             icon: const Icon(Icons.attach_file),
//             onPressed: () {},
//           ),
//           Expanded(
//             child: TextField(
//               controller: _controller,
//               maxLines:
//                   null, // Permet au texte de passer à la ligne automatiquement
//               textInputAction: TextInputAction
//                   .done, // Ferme le clavier sans envoyer le message
//               decoration: InputDecoration(
//                 hintText: 'Type your message...',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(24),
//                   borderSide: BorderSide.none,
//                 ),
//                 contentPadding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 8,
//                 ),
//               ),
//               onSubmitted: (_) =>
//                   FocusScope.of(context).unfocus(), // Ferme le clavier
//             ),
//           ),
//           widget.isGenerating
//               ? const Icon(Icons.send, color: Colors.grey) // Icône désactivée
//               : IconButton(
//                   icon: const Icon(Icons.send),
//                   onPressed: _sendMessage,
//                 ),
//         ],
//       ),
//     );
//   }
// }
// ? Chat Input Fonctionne End

// ? Input Text And Image Okay Start
// import 'dart:io';

// import 'package:ai_chatbot_ui/widgets/image_picker_dialog_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ChatInput extends StatefulWidget {
//   final Function(String, List<ImageAttachment>) onMessageSent;
//   final bool isGenerating;

//   const ChatInput({
//     super.key,
//     required this.onMessageSent,
//     required this.isGenerating,
//   });

//   @override
//   State<ChatInput> createState() => _ChatInputState();
// }

// class _ChatInputState extends State<ChatInput> {
//   final TextEditingController _controller = TextEditingController();
//   final List<ImageAttachment> _attachments = [];
//   final ImagePicker _imagePicker = ImagePicker();

//   Future<void> _pickImage(ImageSource source) async {
//     try {
//       final XFile? image = await _imagePicker.pickImage(
//         source: source,
//         imageQuality: 70,
//       );

//       if (image != null) {
//         final attachment = ImageAttachment(file: File(image.path));

//         // Show description dialog
//         if (mounted) {
//           await showDialog(
//             context: context,
//             builder: (context) => ImagePreviewDialog(
//               attachment: attachment,
//               onSave: (savedAttachment) {
//                 setState(() {
//                   _attachments.add(savedAttachment);
//                 });
//               },
//             ),
//           );
//         }
//       }
//     } catch (e) {
//       print('Error picking image: $e');
//     }
//   }

//   void _showImagePickerDialog() {
//     showDialog(
//       context: context,
//       builder: (context) => ImagePickerDialog(
//         onImageSourceSelected: _pickImage,
//       ),
//     );
//   }

//   Future<void> _sendMessage() async {
//     if (_controller.text.isEmpty && _attachments.isEmpty) return;

//     final message = _controller.text;
//     widget.onMessageSent(message, List.from(_attachments));

//     setState(() {
//       _controller.clear();
//       _attachments.clear();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         if (_attachments.isNotEmpty)
//           Container(
//             height: 100,
//             margin: const EdgeInsets.symmetric(horizontal: 25),
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: _attachments.length,
//               itemBuilder: (context, index) {
//                 final attachment = _attachments[index];
//                 return Container(
//                   margin: const EdgeInsets.only(right: 8),
//                   child: Stack(
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(8),
//                         child: Image.file(
//                           attachment.file,
//                           height: 100,
//                           width: 100,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       Positioned(
//                         top: 4,
//                         right: 4,
//                         child: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               _attachments.removeAt(index);
//                             });
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.all(4),
//                             decoration: BoxDecoration(
//                               color: Colors.black.withOpacity(0.5),
//                               shape: BoxShape.circle,
//                             ),
//                             child: const Icon(
//                               Icons.close,
//                               size: 16,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         Container(
//           padding: const EdgeInsets.all(10),
//           margin:
//               const EdgeInsets.only(left: 25, right: 25, top: 18, bottom: 18),
//           decoration: BoxDecoration(
//             color: Colors.grey[900],
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Row(
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.attach_file),
//                 onPressed: _showImagePickerDialog,
//               ),
//               Expanded(
//                 child: TextField(
//                   controller: _controller,
//                   maxLines: null,
//                   textInputAction: TextInputAction.done,
//                   style: const TextStyle(color: Colors.white),
//                   decoration: InputDecoration(
//                     hintText: 'Type your message...',
//                     hintStyle: TextStyle(color: Colors.grey[400]),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(24),
//                       borderSide: BorderSide.none,
//                     ),
//                     contentPadding: const EdgeInsets.symmetric(
//                       horizontal: 16,
//                       vertical: 8,
//                     ),
//                   ),
//                   onSubmitted: (_) => FocusScope.of(context).unfocus(),
//                 ),
//               ),
//               widget.isGenerating
//                   ? const Icon(Icons.send, color: Colors.grey)
//                   : IconButton(
//                       icon: const Icon(Icons.send),
//                       onPressed: _sendMessage,
//                     ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// ? Input Text And Image Okay End

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:ai_chatbot_ui/widgets/image_picker_dialog_widget.dart';

// class ChatInput extends StatefulWidget {
//   final Function(String, List<ImageAttachment>) onMessageSent;
//   final bool isGenerating;

//   const ChatInput({
//     super.key,
//     required this.onMessageSent,
//     required this.isGenerating,
//   });

//   @override
//   State<ChatInput> createState() => _ChatInputState();
// }

// class _ChatInputState extends State<ChatInput> {
//   final TextEditingController _controller = TextEditingController();
//   final List<ImageAttachment> _attachments = [];
//   final ImagePicker _imagePicker = ImagePicker();

//   // Add a scroll controller
//   final ScrollController _scrollController = ScrollController();

//   Future<void> _pickImage(ImageSource source) async {
//     try {
//       final XFile? image = await _imagePicker.pickImage(
//         source: source,
//         imageQuality: 70,
//       );

//       if (image != null) {
//         final attachment = ImageAttachment(file: File(image.path));

//         if (mounted) {
//           await showDialog(
//             context: context,
//             builder: (context) => ImagePreviewDialog(
//               attachment: attachment,
//               onSave: (savedAttachment) {
//                 setState(() {
//                   _attachments.add(savedAttachment);
//                 });
//               },
//             ),
//           );
//         }
//       }
//     } catch (e) {
//       print('Error picking image: $e');
//     }
//   }

//   void _showImagePickerDialog() {
//     showDialog(
//       context: context,
//       builder: (context) => ImagePickerDialog(
//         onImageSourceSelected: _pickImage,
//       ),
//     );
//   }

//   Future<void> _sendMessage() async {
//     if (_controller.text.isEmpty && _attachments.isEmpty) return;

//     final message = _controller.text;
//     widget.onMessageSent(message, List.from(_attachments));

//     setState(() {
//       _controller.clear();
//       _attachments.clear();
//     });
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         if (_attachments.isNotEmpty)
//           Container(
//             height: 100,
//             margin: const EdgeInsets.symmetric(horizontal: 25),
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: _attachments.length,
//               itemBuilder: (context, index) {
//                 final attachment = _attachments[index];
//                 return Container(
//                   margin: const EdgeInsets.only(right: 8),
//                   child: Stack(
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(8),
//                         child: Image.file(
//                           attachment.file,
//                           height: 100,
//                           width: 100,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       Positioned(
//                         top: 4,
//                         right: 4,
//                         child: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               _attachments.removeAt(index);
//                             });
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.all(4),
//                             decoration: BoxDecoration(
//                               color: Colors.black.withOpacity(0.5),
//                               shape: BoxShape.circle,
//                             ),
//                             child: const Icon(
//                               Icons.close,
//                               size: 16,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         Container(
//           padding: const EdgeInsets.all(10),
//           margin:
//               const EdgeInsets.only(left: 25, right: 25, top: 18, bottom: 18),
//           decoration: BoxDecoration(
//             color: Colors.grey[900],
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.end, // Align items to bottom
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.attach_file),
//                 onPressed: _showImagePickerDialog,
//               ),
//               Expanded(
//                 child: ConstrainedBox(
//                   constraints: const BoxConstraints(
//                     maxHeight: 200, // Maximum height before scrolling
//                   ),
//                   child: SingleChildScrollView(
//                     controller: _scrollController,
//                     child: TextField(
//                       controller: _controller,
//                       maxLines: null,
//                       textInputAction:
//                           TextInputAction.newline, // Changed to newline
//                       style: const TextStyle(color: Colors.white),
//                       decoration: InputDecoration(
//                         hintText: 'Type your message...',
//                         hintStyle: TextStyle(color: Colors.grey[400]),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(24),
//                           borderSide: BorderSide.none,
//                         ),
//                         contentPadding: const EdgeInsets.symmetric(
//                           horizontal: 16,
//                           vertical: 8,
//                         ),
//                         isDense: true, // Makes the input field more compact
//                       ),
//                       onSubmitted: (_) => FocusScope.of(context).unfocus(),
//                     ),
//                   ),
//                 ),
//               ),
//               widget.isGenerating
//                   ? const Icon(Icons.send, color: Colors.grey)
//                   : IconButton(
//                       icon: const Icon(Icons.send),
//                       onPressed: _sendMessage,
//                     ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// ? Cancel button
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ai_chatbot_ui/widgets/image_picker_dialog_widget.dart';

class ChatInput extends StatefulWidget {
  final Function(String, List<ImageAttachment>) onMessageSent;
  final bool isGenerating;
  final VoidCallback onStopGeneration;

  const ChatInput({
    super.key,
    required this.onMessageSent,
    required this.isGenerating,
    required this.onStopGeneration,
  });

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final TextEditingController _controller = TextEditingController();
  final List<ImageAttachment> _attachments = [];
  final ImagePicker _imagePicker = ImagePicker();
  final ScrollController _scrollController = ScrollController();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: source,
        imageQuality: 70,
      );

      if (image != null) {
        final attachment = ImageAttachment(file: File(image.path));

        if (mounted) {
          await showDialog(
            context: context,
            builder: (context) => ImagePreviewDialog(
              attachment: attachment,
              onSave: (savedAttachment) {
                setState(() {
                  _attachments.add(savedAttachment);
                });
              },
            ),
          );
        }
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void _showImagePickerDialog() {
    showDialog(
      context: context,
      builder: (context) => ImagePickerDialog(
        onImageSourceSelected: _pickImage,
      ),
    );
  }

  Future<void> _sendMessage() async {
    if (_controller.text.isEmpty && _attachments.isEmpty) return;

    final message = _controller.text;
    widget.onMessageSent(message, List.from(_attachments));

    setState(() {
      _controller.clear();
      _attachments.clear();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_attachments.isNotEmpty)
          Container(
            height: 100,
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _attachments.length,
              itemBuilder: (context, index) {
                final attachment = _attachments[index];
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          attachment.file,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _attachments.removeAt(index);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        Container(
          padding: const EdgeInsets.all(10),
          margin:
              const EdgeInsets.only(left: 25, right: 25, top: 18, bottom: 18),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.attach_file),
                onPressed: widget.isGenerating ? null : _showImagePickerDialog,
              ),
              Expanded(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 200,
                  ),
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: TextField(
                      controller: _controller,
                      maxLines: null,
                      enabled: !widget.isGenerating,
                      textInputAction: TextInputAction.newline,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Type your message...',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        isDense: true,
                      ),
                      onSubmitted: (_) => FocusScope.of(context).unfocus(),
                    ),
                  ),
                ),
              ),
              widget.isGenerating
                  ? IconButton(
                      icon: const Icon(Icons.stop_circle_outlined),
                      color: Colors.red,
                      onPressed: widget.onStopGeneration,
                    )
                  : IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: _sendMessage,
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
