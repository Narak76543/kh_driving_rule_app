import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kh_driving_rule/app/modules/test/roadTrafficLaw_view.dart';
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
      appBar: const CustomDrivingAppBar(title: 'ទ្រឹស្តីនៃការបើកបរ'),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
              child: CircularProgressIndicator(color: Colors.cyanAccent));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 100),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 15),
                    child: Text('ការផ្សព្វផ្សាយ', style: TextStyle( fontSize: 20, color: Colors.black.withOpacity(0.8))),
                  ),
                ],
              ),
              TheoryCarousel(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.theoryList.length,
                  itemBuilder: (context, index) {
                    return TheoryCard(
                        item: controller.theoryList[index],
                        onTap: () {
                          Get.to(screen_list[index]);
                        }
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
