import 'package:get/get.dart';

import '../controllers/welcomepage_controller.dart';

class WelcomepageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomepageController>(
      () => WelcomepageController(),
    );
  }
}
