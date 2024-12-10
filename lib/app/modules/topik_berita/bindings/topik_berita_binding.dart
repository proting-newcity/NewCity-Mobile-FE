import 'package:get/get.dart';
import 'package:newcity/api.dart';

import '../controllers/topik_berita_controller.dart';

class TopikBeritaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopikBeritaController>(
      () => TopikBeritaController(),
    );
    Get.lazyPut<ApiService>(() => ApiService());
  }
}
