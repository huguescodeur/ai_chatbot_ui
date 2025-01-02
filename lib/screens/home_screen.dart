// import 'package:ai_chatbot_ui/screens/speack_to_ai_screen.dart';
// import 'package:flutter/material.dart';
// import '../widgets/premium_card.dart';
// import '../widgets/feature_button.dart';
// import '../widgets/history_item.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const PremiumCard(),
//               const SizedBox(height: 20),
//               Row(
//                 children: [
//                   Expanded(
//                     child: FeatureButton(
//                       icon: Icons.edit,
//                       label: "Generate ideas and write articles",
//                       onTap: () => Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => SpeakToAIPage(),
//                       )),
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: FeatureButton(
//                       icon: Icons.image,
//                       label: 'Generate\npictures & art',
//                       onTap: () {},
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 24),
//               const Text(
//                 'History',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Expanded(
//                 child: ListView(
//                   children: const [
//                     HistoryItem(
//                       text: 'Give me ideas for writing a nove...',
//                     ),
//                     HistoryItem(
//                       text: 'Help me write a detailed charact...',
//                     ),
//                     HistoryItem(
//                       text: 'Describe and show me the perf...',
//                     ),
//                     HistoryItem(
//                       text: 'Suggest several ways to describ...',
//                     ),
//                     HistoryItem(
//                       text: 'Suggest several ways to describ...',
//                     ),
//                     HistoryItem(
//                       text: 'Suggest several ways to describ...',
//                     ),
//                     HistoryItem(
//                       text: 'Suggest several ways to describ...',
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:ai_chatbot_ui/screens/generate_picture_page.dart';
import 'package:ai_chatbot_ui/screens/speack_to_ai_screen.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../widgets/premium_card.dart';
import '../widgets/feature_button.dart';
import '../widgets/history_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInDown(
                duration: Duration(seconds: 2),
                child: const PremiumCard(),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: SlideInLeft(
                      duration: Duration(seconds: 2),
                      child: FeatureButton(
                        icon: Icons.edit,
                        label: "Generate ideas and write articles",
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SpeakToAIPage(),
                        )),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SlideInRight(
                      duration: Duration(seconds: 2),
                      child: FeatureButton(
                        icon: Icons.image,
                        label: 'Generate\npictures & art',
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => GeneratePicturesPage(),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              FadeInUp(
                duration: Duration(seconds: 1),
                child: const Text(
                  'History',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: [
                    ZoomIn(
                      duration: Duration(seconds: 3),
                      child: const HistoryItem(
                        text: 'Give me ideas for writing a nove...',
                      ),
                    ),
                    ZoomIn(
                      duration: Duration(seconds: 3),
                      child: const HistoryItem(
                        text: 'Help me write a detailed charact...',
                      ),
                    ),
                    ZoomIn(
                      duration: Duration(seconds: 3),
                      child: const HistoryItem(
                        text: 'Describe and show me the perf...',
                      ),
                    ),
                    ZoomIn(
                      duration: Duration(seconds: 3),
                      child: const HistoryItem(
                        text: 'Suggest several ways to describ...',
                      ),
                    ),
                    ZoomIn(
                      duration: Duration(seconds: 3),
                      child: const HistoryItem(
                        text: 'Suggest several ways to describ...',
                      ),
                    ),
                    ZoomIn(
                      duration: Duration(seconds: 3),
                      child: const HistoryItem(
                        text: 'Suggest several ways to describ...',
                      ),
                    ),
                    ZoomIn(
                      duration: Duration(seconds: 3),
                      child: const HistoryItem(
                        text: 'Suggest several ways to describ...',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
