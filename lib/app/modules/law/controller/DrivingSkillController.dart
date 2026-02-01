import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DrivingSkillController extends GetxController {
  var drivingSkillLaws = <dynamic>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    LoadDrivingLaw();
  }

  Future<void> LoadDrivingLaw() async {
    try {
      isLoading(true);

      final String response = await rootBundle.loadString(
        'assets/data/driving_laws.json',
      );
      final List<dynamic> data = json.decode(response);

      drivingSkillLaws.assignAll(data);
    } catch (e) {
      print("Error loading JSON: $e");
    } finally {
      isLoading(false);
    }
  }
}
