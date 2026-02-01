import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kh_driving_rule/const/color.dart';
import 'package:kh_driving_rule/core/widget/app_bar.dart';
import 'package:kh_driving_rule/core/widget/buildTheoryCard.dart';
import 'package:kh_driving_rule/core/widget/list_screen.dart';
import 'package:kh_driving_rule/core/widget/theory_carousel.dart';
import '../controller/home_controller.dart';

class TheoryView extends GetView<HomeController> {
  const TheoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const CustomDrivingAppBar(title: 'ទ្រឹស្តីនៃការបើកបរ'),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
              child: CircularProgressIndicator(color: Colors.cyanAccent));
        }

        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 10),
                child: Text(
                  'ការផ្សព្វផ្សាយ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),

            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: TheoryCarousel(),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    return TheoryCard(
                      item: controller.theoryList[index],
                      onTap: () => Get.to(screen_list[index]),
                    );
                  },
                  childCount: controller.theoryList.length,
                ),
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 100),
            ),
          ],
        );
      }),
    );
  }
}