import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';
import '../../../data/models/law_model.dart';

class LawController extends GetxController {
  var lawList = <LawModel>[].obs;
  var isLoading = true.obs;
  var downloadProgress = 0.0.obs;
  var isDownloading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadLawsFromJson();
  }

  void loadLawsFromJson() async {
    try {
      isLoading(true);
      String jsonString = await rootBundle.loadString('assets/data/laws_data.json');
      List<dynamic> jsonResponse = json.decode(jsonString);
      lawList.value = jsonResponse.map((data) => LawModel.fromJson(data)).toList();
    } catch (e) {
      debugPrint("Error loading JSON: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> exportPdf(String? url, {bool openImmediately = false}) async {
    if (url == null || url.isEmpty) {
      Get.snackbar("កំហុស", "មិនមានតំណភ្ជាប់ឯកសារ", 
        backgroundColor: Colors.redAccent, colorText: Colors.white);
      return;
    }

    debugPrint("Attempting to export PDF: $url");

    try {
      isDownloading(true);
      downloadProgress(0.0);

      final directory = await getApplicationDocumentsDirectory();
      final fileName = url.split('/').last;
      final filePath = "${directory.path}/$fileName";
      final file = File(filePath);

      // check if file already exists in documents directory
      if (!await file.exists()) {
        if (url.startsWith('http')) {
          // It's a web URL
          final dio = Dio();
          await dio.download(url, filePath, onReceiveProgress: (received, total) {
            if (total != -1) downloadProgress.value = received / total;
          });
        } else {
          // It's a local asset
          // Ensure we have the correct asset path
          String assetPath = url;
          if (!url.startsWith('assets/')) {
            assetPath = 'assets/pdf/$url';
          }
          
          debugPrint("Loading asset from: $assetPath");
          final byteData = await rootBundle.load(assetPath);
          await file.writeAsBytes(byteData.buffer.asUint8List(
            byteData.offsetInBytes, byteData.lengthInBytes));
        }
      }

      isDownloading(false);

      if (openImmediately) {
        debugPrint("Opening file: $filePath");
        final result = await OpenFilex.open(filePath);
        if (result.type != ResultType.done) {
          Get.snackbar("កំហុស", "មិនអាចបើកឯកសារបានឡើយ: ${result.message}",
            backgroundColor: Colors.orangeAccent, colorText: Colors.white);
        }
      } else {
        Get.snackbar("ជោគជ័យ", "រក្សាទុកឯកសាររួចរាល់",
          // backgroundColor: Colors.green, colorText: Colors.white,
          mainButton: TextButton(
            onPressed: () => OpenFilex.open(filePath),
            child: const Text("បើកមើល", style: TextStyle(color: Colors.white)),
          ),
        );
      }
    } catch (e) {
      isDownloading(false);
      debugPrint("Export PDF Error: $e");
      Get.snackbar("បរាជ័យ", "មិនអាចរៀបចំឯកសារបានឡើយ (ប្រហែលជាខ្វះ File Asset)",
        backgroundColor: Colors.redAccent.withOpacity(0.07), colorText: Colors.white);
    }
  }
}
