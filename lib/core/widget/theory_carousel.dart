import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../app/modules/home/controller/home_controller.dart';


class TheoryCarousel extends GetView<HomeController> {
  const TheoryCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final List<int> items = [0, 1, 2];

    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 180.0,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                onPageChanged: (index, reason) {
                  controller.activeIndex.value = index;
                },
              ),
              items: items.map((i) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.1),
                      width: 1,
                    ),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF00B4DB), Color(0xFF0083B0)],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'News ${i + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            // Dot Indicator ជាមួយ AnimatedContainer
            Positioned(
              bottom: 15,
              child: Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: items.map((index) {
                  final isSelected = controller.activeIndex.value == index;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: isSelected ? 22.0 : 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isSelected
                          ? Colors.cyanAccent
                          : Colors.white.withOpacity(0.4),
                      boxShadow: isSelected ? [
                        BoxShadow(
                          color: Colors.cyanAccent.withOpacity(0.5),
                          blurRadius: 4,
                          spreadRadius: 1,
                        )
                      ] : [],
                    ),
                  );
                }).toList(),
              )),
            ),
          ],
        ),
      ],
    );
  }
}