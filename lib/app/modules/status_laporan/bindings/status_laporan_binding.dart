import 'package:get/get.dart';

import '../controllers/status_laporan_controller.dart';

class StatusLaporanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatusLaporanController>(
      () => StatusLaporanController(),
    );
  }
}
