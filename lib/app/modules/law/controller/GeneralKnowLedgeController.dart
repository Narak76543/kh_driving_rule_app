import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class GeneralKnowLedgeController extends GetxController {
  var generalKnowLedge = <dynamic>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    GeneralKnowledge();
  }

  Future<void> GeneralKnowledge() async {
    try {
      isLoading(true);

      final String response = await rootBundle.loadString(
        'assets/data/general_knowledege.json',
      );
      final List<dynamic> data = json.decode(response);

      generalKnowLedge.assignAll(data);
    } catch (e) {
      print("Error loading JSON: $e");
    } finally {
      isLoading(false);
    }
  }
}
