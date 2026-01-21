import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kh_driving_rule/core/widget/app_bar.dart';
import '../../../../core/widget/buil_lawCard.dart';
import '../../law/controller/law_controller.dart';

class LawsView extends GetView<LawController> {
  const LawsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomDrivingAppBar(title: 'ច្បាប់ចរាចរណ៍'),
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
              ),
            ),
          ),

          // Main Content
          Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator(color: Colors.cyan));
            }

            if (controller.lawList.isEmpty) {
              return const Center(child: Text("មិនមានទិន្នន័យ", style: TextStyle(color: Colors.white70)));
            }

            return GridView.builder(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 120),
              itemCount: controller.lawList.length,
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
            );
          }),

          // Loading Overlay for Download/Preparation
          Obx(() => controller.isDownloading.value
              ? Container(
            color: Colors.black54,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(color: Colors.cyan),
                  const SizedBox(height: 15),
                  Text(
                    "កំពុងរៀបចំឯកសារ... ${(controller.downloadProgress.value * 100).toInt()}%",
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          )
              : const SizedBox.shrink()),
        ],
      ),
    );
  }
}
