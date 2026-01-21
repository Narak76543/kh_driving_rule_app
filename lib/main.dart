import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/modules/home/binding/home_binding.dart' show HomeBinding;
import 'app/modules/home/views/home_viewe.dart' show HomeView;
import 'app/modules/law/binding/law_binding.dart';
import 'app/modules/law/views/law_view.dart';


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
        scaffoldBackgroundColor: Color(0xFF0B1120),
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
      ],
    );
  }
}
