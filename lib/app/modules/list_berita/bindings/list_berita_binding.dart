import 'package:get/get.dart';

import '../controllers/list_berita_controller.dart';

class ListBeritaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListBeritaController>(
      () => ListBeritaController(),
    );
  }
}
