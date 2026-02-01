import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../const/color.dart';
import '../home/controller/home_controller.dart';
import '../law/controller/DrivingSkillController.dart';

class DrivingSkillView extends GetView<HomeController> {
  DrivingSkillView({super.key});

  final DrivingSkillController drivingController = Get.put(
    DrivingSkillController(),
  );

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
          "ជំនាញបើកបរ",
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontFamily: 'KohSantepheap', // ប្រាកដថាឈ្មោះដូចក្នុង pubspec.yaml
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Obx(() {
        if (drivingController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: kPrimaryColor),
          );
        }

        if (drivingController.drivingSkillLaws.isEmpty) {
          return const Center(child: Text("មិនមានទិន្នន័យ"));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: drivingController.drivingSkillLaws.length,
          itemBuilder: (context, index) {
            final item = drivingController.drivingSkillLaws[index];
            return _buildDrivingLawCard(
              index + 1,
              item['question'] ?? '',
              item['answer'] ?? '',
            );
          },
        );
      }),
    );
  }

  Widget _buildDrivingLawCard(int number, String question, String answer) {
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
