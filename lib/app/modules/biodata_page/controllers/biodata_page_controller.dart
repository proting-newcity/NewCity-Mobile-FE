import 'package:get/get.dart';
import 'package:newcity/models/user.dart';
import 'package:newcity/services/user_service.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

class BiodataPageController extends GetxController {
  var user = Rx<User?>(null);
  Rx<XFile?> photo = Rx<XFile?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchUser() async {
    try {
      var response = await UserService.getMasyarakat();
      user.value = response;
    } catch (e) {
      print('Error fetching user: $e');
    }
  }

  void changeTab(int index) {
    switch (index) {
      case 0:
        Get.toNamed('/beranda', preventDuplicates: false);
        break;
      case 1:
        Get.toNamed('/create-laporan', preventDuplicates: false);
        break;
      case 2:
        Get.toNamed('/biodata-page', preventDuplicates: false);
        break;
    }
  }

  void updateProfileImage() {
    this.photo = photo;
  }
}
