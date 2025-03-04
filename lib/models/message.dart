// class Message {
//   final String text;
//   final bool isUser;
//   final bool hasImage;
//   bool isComplete;

//   Message({
//     required this.text,
//     required this.isUser,
//     this.hasImage = false,
//     this.isComplete = true,
//   });
// }
// ? Message qui fonctionne End

import 'package:ai_chatbot_ui/widgets/image_picker_dialog_widget.dart';

class Message {
  final String text;
  final bool isUser;
  final List<ImageAttachment> attachments;
  bool isComplete;

  Message({
    required this.text,
    required this.isUser,
    this.attachments = const [],
    this.isComplete = true,
  });
}
