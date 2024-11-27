import 'package:get/get.dart';
import 'package:newcity/api.dart';

import '../controllers/create_laporan_controller.dart';

class CreateLaporanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateLaporanController>(
      () => CreateLaporanController(),
    );
    Get.lazyPut<ApiService>(() => ApiService());
  }
}
