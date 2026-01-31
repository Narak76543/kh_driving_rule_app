import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'TrafficLawController.dart';

class TrafficLawView extends StatelessWidget {
  const TrafficLawView({super.key});

  @override
  Widget build(BuildContext context) {
    // ហៅ Get.put នៅទីនេះ
    final TrafficLawController controller = Get.put(TrafficLawController());

    return Scaffold(
      appBar: AppBar(title: const Text("Traffic Law")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.trafficLaws.length,
          itemBuilder: (context, index) {
            final item = controller.trafficLaws[index];
            return ListTile(title: Text(item.question));
          },
        );
      }),
    );
  }
}