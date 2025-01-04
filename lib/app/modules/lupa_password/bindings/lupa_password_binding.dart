import 'package:get/get.dart';
import 'package:newcity/api.dart';

import '../controllers/lupa_password_controller.dart';

class LupaPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LupaPasswordController>(
      () => LupaPasswordController(),
    );
    Get.lazyPut<ApiService>(() => ApiService());
  }
}
