import 'package:get/get.dart';

import '../controllers/list_laporan_controller.dart';

class ListLaporanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListLaporanController>(
      () => ListLaporanController(),
    );
  }
}
