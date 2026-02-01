import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kh_driving_rule/const/color.dart'; // ប្រាកដថា kPrimaryColor គឺ 0xFF1A4958
import '../../app/modules/home/controller/home_controller.dart';

class TheoryCarousel extends GetView<HomeController> {
  const TheoryCarousel({super.key});

  static const List<String> _images = [
    'assets/images/photo1.jpg',
    'assets/images/suggestion_img.jpg',
    'assets/images/logo and doc.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RepaintBoundary(
          child: CarouselSlider.builder(
            itemCount: _images.length,
            options: CarouselOptions(
              height: 180.0,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.easeInOutQuart,
              onPageChanged: (index, reason) => controller.activeIndex.value = index,
            ),
            itemBuilder: (context, index, realIndex) {
              return _buildCarouselItem(_images[index]);
            },
          ),
        ),
        const SizedBox(height: 16),
        _buildDotIndicator(),
      ],
    );
  }

  Widget _buildCarouselItem(String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
          filterQuality: FilterQuality.low,
          errorBuilder: (context, error, stackTrace) => Container(
            color: const Color(0xFF1A4958).withOpacity(0.5),
            child: const Icon(Icons.image_not_supported, color: Colors.white24),
          ),
        ),
      ),
    );
  }

  Widget _buildDotIndicator() {
    return Obx(
          () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(_images.length, (index) {
          final isSelected = controller.activeIndex.value == index;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            width: isSelected ? 24.0 : 8.0,
            height: 6.0,
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isSelected ? kPrimaryColor : Colors.blueGrey.withOpacity(0.2),
              boxShadow: [
                BoxShadow(
                  color: isSelected
                      ? Colors.cyanAccent.withOpacity(0.3)
                      : Colors.transparent,
                  blurRadius: isSelected ? 8 : 0,
                  spreadRadius: isSelected ? 1 : 0,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
