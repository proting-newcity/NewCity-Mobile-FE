import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:newcity/models/user.dart';
import 'package:newcity/services/user_service.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

class BiodataPageController extends GetxController{
  var user = Rx<User?>(null);
  Rx<XFile?> photo = Rx<XFile?>(null);


  @override
  void onInit() {
    super.onInit();
    fetchUser();
    user.value?.name;
    user.value?.username;
    user.value?.phone;
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchUser() async {
    try{
      var response = await UserService.getMasyarakat();
      user.value = response;
    } catch (e) {
      print('Error fetching user: $e');
    }
  }

  void changeTab(int index) {
    // selectedTabIndex.value = index;
    // motionTabBarController.index = index;
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

  void updateProfileImage(){
    this.photo = photo;
  }
}
