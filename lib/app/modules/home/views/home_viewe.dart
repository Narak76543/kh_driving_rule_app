import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kh_driving_rule/const/color.dart';
import '../controller/home_controller.dart' show HomeController;

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(() => controller.pages[controller.currentIndex.value]),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: kPrimaryColor.withOpacity(0.2),
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _navItem(Icons.menu_book, "ទ្រឹស្តី", 0),
                      _navItem(Icons.gavel, "ច្បាប់", 1),
                      _navItem(Icons.settings, "កំណត់", 2),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int index) {
    return InkWell(
      onTap: () => controller.changeIndex(index),
      borderRadius: BorderRadius.circular(20),
      child: Obx(() {
        final isSelected = controller.currentIndex.value == index;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.white.withOpacity(0.1)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(35),
                border: Border.all(
                  color: isSelected ? kPrimaryColor : Colors.transparent,
                  width: isSelected ? 1.5 : 0,
                ),

              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18.5,
                  vertical: 5,
                ),
                child: Icon(
                  icon,
                  color: isSelected ? kPrimaryColor: Colors.grey,
                  size: 30,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
