// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kh_driving_rule/const/color.dart';
// import 'app/modules/home/binding/home_binding.dart' show HomeBinding;
// import 'app/modules/home/views/home_viewe.dart' show HomeView;
// import 'app/modules/law/binding/law_binding.dart';
// import 'app/modules/law/views/law_view.dart';
// import 'app/modules/splash/SplashView.dart';
// import 'app/modules/test/TrafficLawController.dart';
// import 'app/modules/test/roadTrafficLaw_view.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Cambodia Driving Rules',
//       debugShowCheckedModeBanner: false,
//
//       theme: ThemeData(
//         fontFamily: 'KohSantepheab',
//         brightness: Brightness.dark,
//         primarySwatch: Colors.blue,
//         scaffoldBackgroundColor: Color(0xffeef1f6),
//         // scaffoldBackgroundColor: Colors.deepPurple.withOpacity(0.08),
//       ),
//
//       initialRoute: '/home',
//       getPages: [
//         GetPage(
//           name: '/splash',
//           page: () => const SplashView(),
//         ),
//         GetPage(
//           name: '/home',
//           page: () => const HomeView(),
//           binding: HomeBinding(),
//         ),
//         GetPage(
//           name: '/law',
//           page: () => const LawsView(),
//           binding: LawBinding(),
//         ),
//
//         GetPage(
//           name: '/traffic-law',
//           page: () => const TrafficLawView(),
//           binding: BindingsBuilder(() {
//
//             Get.lazyPut<TrafficLawController>(() => TrafficLawController());
//           }),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kh_driving_rule/const/color.dart';
import 'app/modules/home/binding/home_binding.dart' show HomeBinding;
import 'app/modules/home/views/home_viewe.dart' show HomeView;
import 'app/modules/law/binding/law_binding.dart';
import 'app/modules/law/views/law_view.dart';
import 'app/modules/splash/SplashView.dart'; // ប្រាកដថា path នេះត្រឹមត្រូវ
import 'app/modules/test/TrafficLawController.dart';
import 'app/modules/test/roadTrafficLaw_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // កំណត់ពណ៌ដែលអ្នកចង់បាន (Deep Teal)
    const Color primaryColor = Color(0xFF1A4958);

    return GetMaterialApp(
      title: 'Cambodia Driving Rules',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        fontFamily: 'KohSantepheab',
        brightness: Brightness.dark,

        // កំណត់ពណ៌គោលតាមស្ដង់ដារថ្មី
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          primary: primaryColor,
          brightness: Brightness.dark,
        ),

        // ធ្វើឱ្យ Scaffold ថ្លាដើម្បីបង្ហាញរូបភាព Background (bg.jpg) ពីខាងក្រោយ
        scaffoldBackgroundColor: whiteColor,
      ),

      // ១. ប្តូរពី '/home' មកកាន់ '/splash' ដើម្បីឱ្យវាបង្ហាញមុនគេ
      initialRoute: '/splash',

      getPages: [
        // ២. ដាក់ Splash Page នៅលើគេ
        GetPage(
          name: '/splash',
          page: () => const SplashView(),
        ),
        GetPage(
          name: '/home',
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/law',
          page: () => const LawsView(),
          binding: LawBinding(),
        ),
        GetPage(
          name: '/traffic-law',
          page: () => const TrafficLawView(),
          binding: BindingsBuilder(() {
            Get.lazyPut<TrafficLawController>(() => TrafficLawController());
          }),
        ),
      ],
    );
  }
}
