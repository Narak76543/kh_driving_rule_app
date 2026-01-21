import 'package:get/get.dart';
import '../controller/home_controller.dart';
import '../../law/controller/law_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<LawController>(() => LawController());
  }
}
