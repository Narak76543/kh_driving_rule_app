import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:kh_driving_rule/app/modules/law/controller/RightWayController.dart';

import '../../../const/color.dart';

class RightOfWayView extends StatelessWidget {
  RightOfWayView({super.key});
  final RightWayController rightWayController = Get.put(RightWayController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ប្រើ Colors.white ផ្ទាល់ដើម្បីជៀសវាង Error
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kPrimaryColor,
            size: 20,
          ),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "សិទ្ធិអាទិភាព",
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontFamily: 'KohSantepheap', // ប្រាកដថាឈ្មោះដូចក្នុង pubspec.yaml
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Obx(() {
        if (rightWayController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: kPrimaryColor),
          );
        }

        if (rightWayController.rightWay.isEmpty) {
          return const Center(child: Text("មិនមានទិន្នន័យ"));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: rightWayController.rightWay.length,
          itemBuilder: (context, index) {
            final item = rightWayController.rightWay[index];
            return _buildRightOfWayCard(
              index + 1,
              item['question'] ?? '',
              item['answer'] ?? '',
            );
          },
        );
      }),
    );
  }

  Widget _buildRightOfWayCard(int number, String question, String answer) {
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
