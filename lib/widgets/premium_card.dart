// // ignore_for_file: sized_box_for_whitespace

// import 'package:flutter/material.dart';

// class PremiumCard extends StatelessWidget {
//   const PremiumCard({super.key});

// ignore_for_file: sized_box_for_whitespace

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.blue.shade200,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             width: 200,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Premium Plan',
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black),
//                 ),
//                 Text(
//                   'Harness the full power of AI with a Premium Plan',
//                   style: TextStyle(fontSize: 14, color: Colors.black),
//                 ),
//                 Spacer(),
//                 SizedBox(
//                   width: 145,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       padding: EdgeInsets.zero,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                     ),
//                     onPressed: () {},
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Image.asset(
//                           "assets/icons/eclair-white.png",
//                           height: 20,
//                         ),
//                         const Text(
//                           'Upgrade now',
//                           style: TextStyle(color: Colors.white),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             height: double.infinity,
//             // color: Colors.white,
//             child: Image.asset(
//               "assets/icons/robot.png",
//               width: 100,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class PremiumCard extends StatelessWidget {
  const PremiumCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade200,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInDown(
                  delay: Duration(seconds: 2),
                  child: Text(
                    'Premium Plan',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(height: 8),
                FadeInLeft(
                  delay: Duration(seconds: 2),
                  child: Text(
                    'Harness the full power of AI with a Premium Plan',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
                const Spacer(),
                BounceInUp(
                  delay: Duration(seconds: 2),
                  child: SizedBox(
                    width: 145,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            "assets/icons/eclair-white.png",
                            height: 20,
                          ),
                          const Text(
                            'Upgrade now',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Animation for the Image
          SlideInRight(
            // duration: ,
            delay: Duration(seconds: 2),
            child: Container(
              height: double.infinity,
              child: Image.asset(
                "assets/icons/robot.png",
                width: 100,
              ),
            ),
          )
        ],
      ),
    );
  }
}
