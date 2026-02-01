// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kh_driving_rule/const/color.dart';
// import 'TrafficLawController.dart';
//
// class TrafficLawView extends StatelessWidget {
//   const TrafficLawView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final TrafficLawController controller = Get.put(TrafficLawController());
//
//     return Scaffold(
//       backgroundColor: bgColor,
//       appBar: AppBar(
//         backgroundColor: kPrimaryColor,
//         elevation: 0,
//         title: const Text(
//           "ច្បាប់ចរាចរណ៍ផ្លូវគោក",
//           style: TextStyle(fontFamily: 'KohSantepheab', fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: CircularProgressIndicator(color: Colors.cyanAccent));
//         }
//
//         if (controller.trafficLaws.isEmpty) {
//           return const Center(child: Text("មិនមានទិន្នន័យ", style: TextStyle(color: Colors.white70)));
//         }
//
//         return ListView.builder(
//           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//           itemCount: controller.trafficLaws.length,
//           itemBuilder: (context, index) {
//             final item = controller.trafficLaws[index];
//             return _buildLawCard(
//               index + 1,
//               item['question'] ?? '',
//               item['answer'] ?? '',
//             );
//           },
//         );
//       }),
//     );
//   }
//
//   Widget _buildLawCard(int number, String question, String answer) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       decoration: BoxDecoration(
//
//         color: kPrimaryColor,
//         borderRadius: BorderRadius.circular(15),
//         border: Border.all(
//           color: Colors.white.withOpacity(0.15),
//           width: 1.2,
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // លេខរៀងមេរៀន
//             CircleAvatar(
//               radius: 14,
//               backgroundColor: Colors.cyanAccent.withOpacity(0.2),
//               child: Text(
//                 "$number",
//                 style: const TextStyle(color: Colors.cyanAccent, fontSize: 12, fontWeight: FontWeight.bold),
//               ),
//             ),
//             const SizedBox(width: 15),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     question,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       height: 1.5,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   const Divider(color: Colors.white10, height: 1),
//                   const SizedBox(height: 12),
//                   Text(
//                     "ចម្លើយ៖ $answer",
//                     style: TextStyle(
//                       color: Colors.cyanAccent.withOpacity(0.8),
//                       fontSize: 14,
//                       fontStyle: FontStyle.italic,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kh_driving_rule/const/color.dart';
import 'TrafficLawController.dart';

class TrafficLawView extends StatelessWidget {
  const TrafficLawView({super.key});

  @override
  Widget build(BuildContext context) {
    final TrafficLawController controller = Get.put(TrafficLawController());

    return Scaffold(
      // ប្រើ Colors.white ផ្ទាល់ដើម្បីជៀសវាង Error
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: kPrimaryColor, size: 20),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "ច្បាប់ចរាចរណ៍ផ្លូវគោក",
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontFamily: 'KohSantepheap', // ប្រាកដថាឈ្មោះដូចក្នុង pubspec.yaml
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator(color: kPrimaryColor));
        }

        if (controller.trafficLaws.isEmpty) {
          return const Center(child: Text("មិនមានទិន្នន័យ"));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: controller.trafficLaws.length,
          itemBuilder: (context, index) {
            final item = controller.trafficLaws[index];
            return _buildLawCard(
              index + 1,
              item['question'] ?? '',
              item['answer'] ?? '',
            );
          },
        );
      }),
    );
  }

  Widget _buildLawCard(int number, String question, String answer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 14,
              backgroundColor: kPrimaryColor.withOpacity(0.1),
              child: Text(
                "$number",
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontFamily: 'Poppins', // សម្រាប់ភាសាអង់គ្លេស/លេខ
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    question,
                    style: const TextStyle(
                      color: Color(0xFF1E293B),
                      fontFamily: 'KohSantepheap',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Divider(height: 25, thickness: 0.5),
                  Text(
                    "ចម្លើយ៖ $answer",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontFamily: 'KohSantepheap',
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}