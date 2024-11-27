import 'package:get/get.dart';

import '../controllers/create_laporan_controller.dart';

class CreateLaporanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateLaporanController>(
      () => CreateLaporanController(),
    );
  }
}
