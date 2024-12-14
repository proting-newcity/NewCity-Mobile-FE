import 'package:get/get.dart';

import '../controllers/list_pencarian_laporan_controller.dart';

class ListPencarianLaporanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListPencarianLaporanController>(
      () => ListPencarianLaporanController(),
    );
  }
}
