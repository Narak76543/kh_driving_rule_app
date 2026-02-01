// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kh_driving_rule/const/color.dart';
// import 'package:kh_driving_rule/core/widget/app_bar.dart';
// import '../../../../core/widget/buil_lawCard.dart';
// import '../../law/controller/law_controller.dart';
//
// class LawsView extends GetView<LawController> {
//   const LawsView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomDrivingAppBar(title: 'ច្បាប់ចរាចរណ៍'),
//       body: Stack(
//         children: [
//           // Background
//           Container(
//             decoration: const BoxDecoration(
//               color: Color(0xffeef1f6)
//             ),
//           ),
//
//           // Main Content
//           Obx(() {
//             if (controller.isLoading.value) {
//               return const Center(child: CircularProgressIndicator(color: Colors.cyan));
//             }
//
//             if (controller.lawList.isEmpty) {
//               return const Center(child: Text("មិនមានទិន្នន័យ", style: TextStyle(color: Colors.white70)));
//             }
//
//             return GridView.builder(
//               padding: const EdgeInsets.fromLTRB(15, 20, 15, 120),
//               itemCount: controller.lawList.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 15,
//                 crossAxisSpacing: 15,
//                 childAspectRatio: 0.6,
//               ),
//               itemBuilder: (context, index) {
//                 final law = controller.lawList[index];
//                 return LawCard(
//                   law: law,
//                   onTap: () => controller.exportPdf(law.pdfUrl, openImmediately: true),
//                   onDownload: () => controller.exportPdf(law.pdfUrl, openImmediately: false),
//                 );
//               },
//             );
//           }),
//
//           // Loading Overlay for Download/Preparation
//           Obx(() => controller.isDownloading.value
//               ? Container(
//             color: Colors.black54,
//             child: Center(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const CircularProgressIndicator(color: Colors.cyan),
//                   const SizedBox(height: 15),
//                   Text(
//                     "កំពុងរៀបចំឯកសារ... ${(controller.downloadProgress.value * 100).toInt()}%",
//                     style: const TextStyle(color: Colors.white, fontSize: 16),
//                   ),
//                 ],
//               ),
//             ),
//           )
//               : const SizedBox.shrink()),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kh_driving_rule/core/widget/app_bar.dart';
import '../../../../core/widget/buil_lawCard.dart';
import '../../law/controller/law_controller.dart';

class LawsView extends GetView<LawController> {
  const LawsView({super.key});

  @override
  Widget build(BuildContext context) {
    // កំណត់ពណ៌ដែលអ្នកចង់បាន
    const Color primaryDark = Color(0xFF1A4958);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const CustomDrivingAppBar(title: 'ច្បាប់ចរាចរណ៍'),
      body: Stack(
        children: [
          // ២. Main Content
          Obx(() {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.cyanAccent),
              );
            }

            if (controller.lawList.isEmpty) {
              return Center(
                child: Text(
                  "មិនមានទិន្នន័យ",
                  style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 16),
                ),
              );
            }

            return GridView.builder(
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
            );
          }),

          // ៣. Loading Overlay ស្ទីលកញ្ចក់ងងឹត (Blur Background)
          Obx(() => controller.isDownloading.value
              ? _buildDownloadOverlay(controller.downloadProgress.value)
              : const SizedBox.shrink()),
        ],
      ),
    );
  }

  // Widget ជំនួយសម្រាប់បង្ហាញការ Download ឱ្យមើលទៅទំនើប
  Widget _buildDownloadOverlay(double progress) {
    return Container(
      color: Colors.black.withOpacity(0.6),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: const Color(0xFF1A4958).withOpacity(0.8),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                value: progress,
                color: Colors.cyanAccent,
                backgroundColor: Colors.white10,
              ),
              const SizedBox(height: 20),
              Text(
                "កំពុងរៀបចំឯកសារ... ${(progress * 100).toInt()}%",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}