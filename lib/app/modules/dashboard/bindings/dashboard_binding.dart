import 'package:get/get.dart';
import 'package:newcity/app/modules/beranda/controllers/beranda_controller.dart';
import 'package:newcity/app/modules/biodata_page/controllers/biodata_page_controller.dart';
import 'package:newcity/app/modules/create_laporan/controllers/create_laporan_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<BerandaController>(
      () => BerandaController(),
    );
    Get.lazyPut<BiodataPageController>(
      () => BiodataPageController(),
    );
    Get.lazyPut<CreateLaporanController>(
      () => CreateLaporanController(),
    );
  }
}
