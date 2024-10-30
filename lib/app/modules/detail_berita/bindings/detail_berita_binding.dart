import 'package:get/get.dart';

import '../controllers/detail_berita_controller.dart';

class DetailBeritaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailBeritaController>(
      () => DetailBeritaController(),
    );
  }
}
