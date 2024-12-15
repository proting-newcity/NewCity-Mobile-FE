import 'package:get/get.dart';
import 'package:newcity/api.dart';

import '../controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
      () => RegisterController(),
    );
    Get.lazyPut<ApiService>(() => ApiService());
  }
}
