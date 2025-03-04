// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:async';

// class ChatService {
//   final String baseUrl = 'https://trusty-awaited-chow.ngrok-free.app';

//   Stream<String> streamResponse(String message) async* {
//     try {
//       print('Sending message to: $baseUrl/chat/');
//       final response = await http.post(
//         Uri.parse('$baseUrl/chat/'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//         },
//         body: jsonEncode({'message': message}),
//       );

//       print('Response status: ${response.statusCode}');
//       print('Response body: ${response.body}');

//       if (response.statusCode == 200) {
//         final responseData = jsonDecode(response.body);
//         final fullResponse = responseData['response'] as String;

//         String currentText = '';
//         for (int i = 0; i < fullResponse.length; i++) {
//           await Future.delayed(const Duration(milliseconds: 20));
//           currentText += fullResponse[i];
//           yield currentText;
//         }
//       } else {
//         throw Exception('Failed to get response: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error in streamResponse: $e');
//       yield "Une erreur s'est produite lors de la génération de la réponse.";
//     }
//   }
// }
// ? Chat Service fonctionne End

// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:ai_chatbot_ui/widgets/image_picker_dialog_widget.dart';

// class ChatService {
//   final String baseUrl = 'https://trusty-awaited-chow.ngrok-free.app';

//   Stream<String> streamResponse(
//       String message, List<ImageAttachment> attachments) async* {
//     try {
//       // Convert images to base64 format
//       List<Map<String, String>> imageData = [];
//       for (var attachment in attachments) {
//         final bytes = await attachment.file.readAsBytes();
//         final base64Image = base64Encode(bytes);
//         imageData.add({
//           'image': base64Image,
//           // 'description': attachment.description,
//         });
//       }

//       print('Sending message to: $baseUrl/chat/');
//       final response = await http.post(
//         Uri.parse('$baseUrl/chat/'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//         },
//         body: jsonEncode({
//           'message': message,
//           'images': imageData,
//         }),
//       );

//       print('Response status: ${response.statusCode}');
//       print('Response body: ${response.body}');

//       if (response.statusCode == 200) {
//         final responseData = jsonDecode(response.body);
//         final fullResponse = responseData['response'] as String;

//         String currentText = '';
//         for (int i = 0; i < fullResponse.length; i++) {
//           await Future.delayed(const Duration(milliseconds: 20));
//           currentText += fullResponse[i];
//           yield currentText;
//         }
//       } else {
//         throw Exception('Failed to get response: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error in streamResponse: $e');
//       yield "Une erreur s'est produite lors de la génération de la réponse.";
//     }
//   }
// }

// ? Cancel button
// import 'dart:async';
// import 'dart:convert';
// import 'package:ai_chatbot_ui/widgets/image_picker_dialog_widget.dart';
// import 'package:http/http.dart' as http;

// class ChatService {
//   final String baseUrl = 'https://trusty-awaited-chow.ngrok-free.app';
//   bool isCancelled = false;

//   void cancelGeneration() {
//     isCancelled = true;
//   }

//   Stream<String> streamResponse(
//     String message,
//     List<ImageAttachment> attachments
//   ) async* {
//     try {
//       isCancelled = false;

//       // Préparation des images
//       List<Map<String, String>> imageData = [];
//       for (var attachment in attachments) {
//         final bytes = await attachment.file.readAsBytes();
//         final base64Image = base64Encode(bytes);
//         imageData.add({
//           'image': base64Image,
//         });
//       }

//       final response = await http.post(
//         Uri.parse('$baseUrl/chat/'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//         },
//         body: jsonEncode({
//           'message': message,
//           'images': imageData,
//         }),
//       );

//       if (response.statusCode == 200) {
//         final responseData = jsonDecode(response.body);
//         final fullResponse = responseData['response'] as String;

//         // Découpage de la réponse en blocs de mots
//         final words = fullResponse.split(' ');
//         String currentText = '';
//         List<String> currentBlock = [];

//         // Taille de bloc souhaitée (en nombre de mots)
//         const blockSize = 5;

//         for (int i = 0; i < words.length; i++) {
//           if (isCancelled) {
//             break;
//           }

//           currentBlock.add(words[i]);

//           // Générer un bloc quand on atteint la taille souhaitée ou à la fin
//           if (currentBlock.length >= blockSize || i == words.length - 1) {
//             // Ajouter le bloc au texte courant
//             currentText += currentBlock.join(' ') + ' ';
//             yield currentText;

//             // Attendre un court délai pour l'effet visuel
//             await Future.delayed(const Duration(milliseconds: 50));

//             // Réinitialiser le bloc courant
//             currentBlock = [];
//           }
//         }
//       } else {
//         print("Response: $response");
//         throw Exception('Failed to get response: ${response.statusCode}');
//       }
//     } catch (e) {
//       yield "Une erreur s'est produite lors de la génération de la réponse.";
//     }
//   }
// }
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ai_chatbot_ui/widgets/image_picker_dialog_widget.dart';

class ChatService {
  final String baseUrl = 'https://trusty-awaited-chow.ngrok-free.app';
  bool _isCancelled = false;

  void cancelGeneration() {
    _isCancelled = true;
  }

  Stream<String> streamResponse(
      String message, List<ImageAttachment> attachments) async* {
    try {
      _isCancelled = false;
      List<Map<String, String>> imageData = [];
      for (var attachment in attachments) {
        final bytes = await attachment.file.readAsBytes();
        final base64Image = base64Encode(bytes);
        imageData.add({
          'image': base64Image,
        });
      }

      final response = await http.post(
        Uri.parse('$baseUrl/chat/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'message': message,
          'images': imageData,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final fullResponse = responseData['response'] as String;

        // for (int i = 0; i < fullResponse.length; i++) {
        //   if (_isCancelled) {
        //     break; // Stop generation if cancelled
        //   }
        //   await Future.delayed(const Duration(milliseconds: 5));
        //   currentText += fullResponse[i];
        //   yield currentText;
        // }
        //         // Découpage de la réponse en blocs de mots
        final words = fullResponse.split(' ');
        String currentText = '';
        List<String> currentBlock = [];

        // Taille de bloc souhaitée (en nombre de mots)
        const blockSize = 5;

        for (int i = 0; i < words.length; i++) {
          if (_isCancelled) {
            break;
          }

          currentBlock.add(words[i]);

          // Générer un bloc quand on atteint la taille souhaitée ou à la fin
          if (currentBlock.length >= blockSize || i == words.length - 1) {
            // Ajouter le bloc au texte courant
            currentText += '${currentBlock.join(' ')} ';
            yield currentText;

            // Attendre un court délai pour l'effet visuel
            // await Future.delayed(const Duration(milliseconds: 5));

            // Réinitialiser le bloc courant
            currentBlock = [];
          }
        }
      } else {
        print("Response: $response");
        throw Exception('Failed to get response: ${response.statusCode}');
      }
    } catch (e) {
      yield "Une erreur s'est produite lors de la génération de la réponse.";
    }
  }
}

// ? Chat GPT
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:ai_chatbot_ui/widgets/image_picker_dialog_widget.dart';

// class ChatService {
//   final String baseUrl = 'https://trusty-awaited-chow.ngrok-free.app';
//   bool _isCancelled = false;

//   void cancelGeneration() {
//     _isCancelled = true;
//   }

//   Stream<String> streamResponse(
//       String message, List<ImageAttachment> attachments) async* {
//     try {
//       _isCancelled = false;
//       List<Map<String, String>> imageData = [];
//       for (var attachment in attachments) {
//         final bytes = await attachment.file.readAsBytes();
//         final base64Image = base64Encode(bytes);
//         imageData.add({
//           'image': base64Image,
//         });
//       }

//       final response = await http.post(
//         Uri.parse('$baseUrl/chat/'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//         },
//         body: jsonEncode({
//           'message': message,
//           'images': imageData,
//         }),
//       );

//       if (response.statusCode == 200) {
//         final responseData = jsonDecode(response.body);
//         final fullResponse = responseData['response'] as String;

//         // Split response into sentences for more natural chunking
//         final sentences = fullResponse.split(RegExp(r'(?<=[.!?])\s+'));
//         String currentText = '';
//         String buffer = '';

//         for (int i = 0; i < sentences.length; i++) {
//           if (_isCancelled) break;

//           // Add sentence to buffer
//           buffer += (buffer.isEmpty ? '' : ' ') + sentences[i];

//           // Stream multiple sentences at once (ChatGPT-like chunks)
//           if (i % 2 == 0 || i == sentences.length - 1) {
//             currentText += (currentText.isEmpty ? '' : ' ') + buffer;
//             buffer = '';
//             // Minimal delay for very fast generation
//             await Future.delayed(const Duration(milliseconds: 1));
//             yield currentText;
//           }
//         }

//         // Ensure any remaining buffer is sent
//         if (buffer.isNotEmpty && !_isCancelled) {
//           currentText += ' ' + buffer;
//           yield currentText;
//         }
//       } else {
//         throw Exception('Failed to get response: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error in streamResponse: $e');
//       yield "Une erreur s'est produite lors de la génération de la réponse.";
//     }
//   }
// }
