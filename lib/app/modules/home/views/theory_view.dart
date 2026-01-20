import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kh_driving_rule/core/widget/app_bar.dart';
import 'package:kh_driving_rule/core/widget/buildTheoryCard.dart';

import '../controller/home_controller.dart';

class TheoryView extends GetView<HomeController> {
  const TheoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomDrivingAppBar(title: 'ទ្រឹស្តីនៃការបើកបរ'),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 100),
          itemCount: controller.theoryList.length,
          itemBuilder: (context, index) {
            return TheoryCard(item: controller.theoryList[index], onTap: () {});
          },
        );
      }),
    );
  }
}
