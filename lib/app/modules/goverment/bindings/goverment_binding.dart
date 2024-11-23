import 'package:get/get.dart';

import '../controllers/goverment_controller.dart';

class GovermentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GovermentController>(
      () => GovermentController(),
    );
  }
}
