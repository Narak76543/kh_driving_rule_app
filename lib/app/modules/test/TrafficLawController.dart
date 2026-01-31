import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TrafficLawController extends GetxController {
  var trafficLaws = <dynamic>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadTrafficLaws();
  }

  Future<void> loadTrafficLaws() async {
    try {
      isLoading(true);
      // ត្រូវប្រាកដថា Path នេះមានក្នុង pubspec.yaml
      String jsonString = await rootBundle.loadString('assets/data/traffic_laws.json');
      List<dynamic> data = json.decode(jsonString);
      trafficLaws.assignAll(data);
    } catch (e) {
      debugPrint("Error loading JSON: $e");
    } finally {
      isLoading(false);
    }
  }
}