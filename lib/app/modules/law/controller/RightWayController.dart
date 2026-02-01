import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RightWayController extends GetxController {
  var rightWay = <dynamic>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    RightWayLaw();
  }

  Future<void> RightWayLaw() async {
    try {
      isLoading(true);

      final String response = await rootBundle.loadString(
        'assets/data/right_way.json',
      );
      final List<dynamic> data = json.decode(response);

      rightWay.assignAll(data);
    } catch (e) {
      print("Error loading JSON: $e");
    } finally {
      isLoading(false);
    }
  }
}
