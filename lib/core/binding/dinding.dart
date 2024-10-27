import 'package:flutter_application_learning/controllers/Profile_Controller.dart';
import 'package:flutter_application_learning/controllers/home_controller.dart';
import 'package:get/get.dart';

class AllBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => HomeController());
  }
}
