import 'package:get/get.dart';

import '../controllers/biodata_page_controller.dart';

class BiodataPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BiodataPageController>(
      () => BiodataPageController(),
    );
  }
}
