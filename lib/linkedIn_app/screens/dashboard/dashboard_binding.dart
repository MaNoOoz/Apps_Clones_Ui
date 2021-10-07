import 'package:get/get.dart';
import 'package:ui_clones/linkedIn_app/screens/home/home_controller.dart';
import 'package:ui_clones/linkedIn_app/screens/profile/profile_controller.dart';

import 'dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
