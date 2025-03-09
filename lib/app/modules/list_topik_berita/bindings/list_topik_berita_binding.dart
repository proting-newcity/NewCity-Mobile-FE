import 'package:get/get.dart';

import '../controllers/list_topik_berita_controller.dart';

class ListTopikBeritaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListTopikBeritaController>(
      () => ListTopikBeritaController(),
    );
  }
}
