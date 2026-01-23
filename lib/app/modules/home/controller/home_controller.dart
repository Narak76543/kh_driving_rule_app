import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kh_driving_rule/app/data/models/lesson_model.dart';
import '../../law/views/law_view.dart';
import '../views/settings_view.dart';
import '../views/theory_view.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  // home_controller.dart
  var activeIndex = 0.obs;

  final List<Widget> pages = [
    const TheoryView(),
    const LawsView(),
    const SettingView(),
  ];

  var theoryList = <LessonModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadTheoryFromJson();
  }

  Future<void> loadTheoryFromJson() async {
    try {
      isLoading(true);
      final String response = await rootBundle.loadString(
        'assets/data/theory_data.json',
      );

      final List<dynamic> data = json.decode(response);
      print("Loaded ${data.length} items from JSON");

      theoryList.assignAll(data.map((e) => LessonModel.fromJson(e)).toList());
      print("Theory list now has ${theoryList.length} items");
    } catch (e) {
      print("Error loading JSON: $e");
    } finally {
      isLoading(false);
    }
  }

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
