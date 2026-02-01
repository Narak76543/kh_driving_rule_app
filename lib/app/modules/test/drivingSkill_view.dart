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
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: const Text(
          " ជំនាញបើកបរ",
          style: TextStyle(
            fontFamily: 'KohSantepheab',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.drive_eta_outlined),
          ),
        ],
      ),
      body: Obx(() {
        if (drivingController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.cyanAccent),
          );
        }

        if (drivingController.drivingSkillLaws.isEmpty) {
          return const Center(
            child: Text(
              "មិនមានទិន្នន័យ",
              style: TextStyle(color: Colors.white70),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          itemCount: drivingController.drivingSkillLaws.length,
          itemBuilder: (context, index) {
            final item = drivingController.drivingSkillLaws[index];
            return _buildDrivingLawsCard(
              index + 1,
              item['question'] ?? '',
              item['answer'] ?? '',
            );
          },
        );
      }),
    );
  }

  Widget _buildDrivingLawsCard(int number, String question, String answer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white.withOpacity(0.15), width: 1.2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // លេខរៀងមេរៀន
            CircleAvatar(
              radius: 14,
              backgroundColor: Colors.cyanAccent.withOpacity(0.2),
              child: Text(
                "$number",
                style: const TextStyle(
                  color: Colors.cyanAccent,
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
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Divider(color: Colors.white10, height: 1),
                  const SizedBox(height: 12),
                  Text(
                    "ចម្លើយ៖ $answer",
                    style: TextStyle(
                      color: Colors.cyanAccent.withOpacity(0.8),
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
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
