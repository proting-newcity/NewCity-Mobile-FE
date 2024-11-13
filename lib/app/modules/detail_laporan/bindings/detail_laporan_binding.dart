import 'package:get/get.dart';

import '../controllers/detail_laporan_controller.dart';

class DetailLaporanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailLaporanController>(
      () => DetailLaporanController(),
    );
  }
}
