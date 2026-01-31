import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/modules/home/binding/home_binding.dart' show HomeBinding;
import 'app/modules/home/views/home_viewe.dart' show HomeView;
import 'app/modules/law/binding/law_binding.dart';
import 'app/modules/law/views/law_view.dart';
import 'app/modules/test/TrafficLawController.dart';
import 'app/modules/test/roadTrafficLaw_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cambodia Driving Rules',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        fontFamily: 'KohSantepheab',
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        // scaffoldBackgroundColor: Colors.deepPurple.withOpacity(0.08),
      ),

      initialRoute: '/home',
      getPages: [
        GetPage(
          name: '/home',
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/law',
          page: () => const LawsView(),
          binding: LawBinding(), // ដាក់ Binding នៅទីនេះ
        ),

        GetPage(
          name: '/traffic-law', // ឬឈ្មោះ route ដែលអ្នកប្រើ
          page: () => const TrafficLawView(),
          binding: BindingsBuilder(() {
            // ដាក់បញ្ចូល Controller ទៅក្នុង Memory ពេលបើក Page នេះ
            Get.lazyPut<TrafficLawController>(() => TrafficLawController());
          }),
        ),

        //   GetPage(
        //     name: '/traffic-law',
        //     page: () => const TrafficLawView(),
        //     // ប្រើ BindingsBuilder ដើម្បីបង្កើត Controller ភ្លាមៗ
        //     binding: BindingsBuilder(() {
        //       Get.lazyPut<TrafficLawController>(() => TrafficLawController());
        //     }),
        //   ),
      ],
    );
  }
}
