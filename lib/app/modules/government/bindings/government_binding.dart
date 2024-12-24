import 'package:get/get.dart';

import '../controllers/government_controller.dart';

class GovernmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GovernmentController>(
      () => GovernmentController(),
    );
  }
}
