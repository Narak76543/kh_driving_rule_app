import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

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

      final String response = await rootBundle.loadString('assets/data/traffic_laws.json');
      final List<dynamic> data = json.decode(response);

      trafficLaws.assignAll(data);

    } catch (e) {
      print("Error loading JSON: $e");
    } finally {
      isLoading(false);
    }
  }
}