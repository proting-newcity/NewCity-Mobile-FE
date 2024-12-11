import 'package:get/get.dart';

import '../controllers/laporan_tersaring_controller.dart';

class LaporanTersaringBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanTersaringController>(
      () => LaporanTersaringController(),
    );
  }
}
