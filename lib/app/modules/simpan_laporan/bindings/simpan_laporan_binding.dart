import 'package:get/get.dart';

import '../controllers/simpan_laporan_controller.dart';

class SimpanLaporanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SimpanLaporanController>(
      () => SimpanLaporanController(),
    );
  }
}
