import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kh_driving_rule/const/color.dart';
import 'app/modules/home/binding/home_binding.dart' show HomeBinding;
import 'app/modules/home/views/home_viewe.dart' show HomeView;
import 'app/modules/law/binding/law_binding.dart';
import 'app/modules/law/views/law_view.dart';
import 'app/modules/splash/SplashView.dart';
import 'app/modules/test/TrafficLawController.dart';
import 'app/modules/test/roadTrafficLaw_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF1A4958);

    return GetMaterialApp(
      title: 'Cambodia Driving Rules',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        fontFamily: 'KohSantepheab',
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          primary: primaryColor,
          brightness: Brightness.dark,
        ),

        scaffoldBackgroundColor: bgColor,
      ),

      initialRoute: '/splash',

      getPages: [
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
