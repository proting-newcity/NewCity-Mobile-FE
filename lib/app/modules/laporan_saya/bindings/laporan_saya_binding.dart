import 'package:get/get.dart';

import '../controllers/laporan_saya_controller.dart';

class LaporanSayaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanSayaController>(
      () => LaporanSayaController(),
    );
  }
}
