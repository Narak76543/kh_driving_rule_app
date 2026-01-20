import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.01),
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
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
      child: Obx(() {
        final isSelected = controller.currentIndex.value == index;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: isSelected ? Colors.cyan : Colors.white70),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.cyan : Colors.white70,
                fontSize: 12,
              ),
            ),
          ],
        );
      }),
    );
  }
}
