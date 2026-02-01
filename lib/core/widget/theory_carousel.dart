import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kh_driving_rule/const/color.dart';
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
      children: [
        CarouselSlider.builder(
          itemCount: _images.length,
          options: CarouselOptions(
            height: 180.0,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.88,
            autoPlayCurve: Curves.fastOutSlowIn,
            onPageChanged: (index, reason) => controller.activeIndex.value = index,
          ),
          itemBuilder: (context, index, realIndex) {
            return _buildCarouselItem(_images[index]);
          },
        ),
        const SizedBox(height: 12),
        _buildDotIndicator(),
      ],
    );
  }
  Widget _buildCarouselItem(String imagePath) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
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
        children: List.generate(_images.length, (index) {
          final isSelected = controller.activeIndex.value == index;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: isSelected ? 20.0 : 7.0,
            height: 7.0,
            margin: const EdgeInsets.symmetric(horizontal: 3.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isSelected ? kPrimaryColor : Colors.grey.withOpacity(0.3),
              boxShadow: isSelected
                  ? [
                BoxShadow(
                  color: Colors.cyanAccent.withOpacity(0.4),
                  blurRadius: 6,
                  spreadRadius: 1,
                ),
              ]
                  : [],
            ),
          );
        }),
      ),
    );
  }
}