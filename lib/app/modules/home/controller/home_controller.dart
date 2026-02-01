import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kh_driving_rule/app/data/models/lesson_model.dart';
import '../../law/views/law_view.dart';
import '../views/settings_view.dart';
import '../views/theory_view.dart';

class HomeController extends GetxController {
  late PageController pageController;

  var currentIndex = 0.obs;
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
    pageController = PageController(initialPage: currentIndex.value);
    loadTheoryFromJson();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  Future<void> loadTheoryFromJson() async {
    try {
      isLoading(true);
      final String response = await rootBundle.loadString(
        'assets/data/theory_data.json',
      );

      final List<dynamic> data = json.decode(response);
      theoryList.assignAll(data.map((e) => LessonModel.fromJson(e)).toList());
    } catch (e) {
      debugPrint("Error loading JSON: $e");
    } finally {
      isLoading(false);
    }
  }

  void changeIndex(int index) {
    currentIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOutQuart,
    );
  }
}