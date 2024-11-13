import 'package:get/get.dart';

import '../controllers/pencarian_laporan_controller.dart';

class PencarianLaporanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PencarianLaporanController>(
      () => PencarianLaporanController(),
    );
  }
}
