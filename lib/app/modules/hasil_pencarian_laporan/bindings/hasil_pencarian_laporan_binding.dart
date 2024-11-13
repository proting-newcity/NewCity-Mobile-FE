import 'package:get/get.dart';

import '../controllers/hasil_pencarian_laporan_controller.dart';

class HasilPencarianLaporanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HasilPencarianLaporanController>(
      () => HasilPencarianLaporanController(),
    );
  }
}
