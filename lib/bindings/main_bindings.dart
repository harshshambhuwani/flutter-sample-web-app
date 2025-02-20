

import 'package:flutter_testing/controllers/theme_controller.dart';
import 'package:get/get.dart';



class MainBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(() => ThemeController());
  }
}