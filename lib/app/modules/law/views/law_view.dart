
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kh_driving_rule/const/color.dart'; // ប្រាកដថា kPrimaryColor គឺ 0xFF1A4958
import 'package:kh_driving_rule/core/widget/app_bar.dart';
import '../../../../core/widget/buil_lawCard.dart';
import '../../law/controller/law_controller.dart';

class LawsView extends GetView<LawController> {
  const LawsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: const CustomDrivingAppBar(title: 'ច្បាប់ចរាចរណ៍'),
      body: Stack(
        children: [
          Obx(() {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(color: kPrimaryColor),
              );
            }

            if (controller.lawList.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.folder_off_outlined, size: 60, color: Colors.grey[300]),
                    const SizedBox(height: 10),
                    Text(
                      "មិនមានទិន្នន័យ",
                      style: TextStyle(color: Colors.grey[500], fontSize: 16),
                    ),
                  ],
                ),
              );
            }
            return RepaintBoundary(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 120),
                itemCount: controller.lawList.length,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (context, index) {
                  final law = controller.lawList[index];
                  return LawCard(
                    law: law,
                    onTap: () => controller.exportPdf(law.pdfUrl, openImmediately: true),
                    onDownload: () => controller.exportPdf(law.pdfUrl, openImmediately: false),
                  );
                },
              ),
            );
          }),

          Obx(() => controller.isDownloading.value
              ? _buildLightDownloadOverlay(controller.downloadProgress.value)
              : const SizedBox.shrink()),
        ],
      ),
    );
  }
  Widget _buildLightDownloadOverlay(double progress) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
      child: Container(
        color: Colors.white.withOpacity(0.4),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 6,
                      color: kPrimaryColor,
                      backgroundColor: kPrimaryColor.withOpacity(0.1),
                    ),
                    Text(
                      "${(progress * 100).toInt()}%",
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "កំពុងរៀបចំឯកសារ...",
                  style: TextStyle(
                    color: Color(0xFF1E293B),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "សូមរង់ចាំមួយភ្លែត",
                  style: TextStyle(color: Colors.grey[500], fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}