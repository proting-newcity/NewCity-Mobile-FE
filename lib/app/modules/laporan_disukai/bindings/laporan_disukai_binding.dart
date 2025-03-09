import 'package:get/get.dart';

import '../controllers/laporan_disukai_controller.dart';

class LaporanDisukaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanDisukaiController>(
      () => LaporanDisukaiController(),
    );
  }
}
