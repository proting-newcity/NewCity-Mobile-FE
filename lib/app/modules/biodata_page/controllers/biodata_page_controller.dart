import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

class BiodataPageController extends GetxController
    with GetTickerProviderStateMixin {
  var userId = ''.obs;
  var userName = ''.obs;
  var userEmail = ''.obs;
  var userPhone = ''.obs;
  var selectedTabIndex = 1.obs;
  late MotionTabBarController motionTabBarController;
  //var profileImagePath = ''.obs;

  var updateFlag = false.obs;

  void setUserId(String id) {
    userId.value = id;
  }

  void onInit() {
    super.onInit();
    motionTabBarController =
        MotionTabBarController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  void onClose() {
    motionTabBarController!.dispose();
    super.onClose();
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

  Future<void> fetchUserData() async {
    if (userName.value.isEmpty ||
        userEmail.value.isEmpty ||
        userPhone.value.isEmpty) {
      final response = await http.get(Uri.parse(
          'http://10.0.2.2/newcity/fetchUsername.php?id=${userId.value}'));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        userName.value = data['username'];

        switch (userId.value) {
          case '1':
            userName.value = 'kalpratama';
            userEmail.value = 'kalpratama@gmail.com';
            userPhone.value = '080000000009';
            break;
          case '2':
            userEmail.value = 'fionadhilla17@gmail.com';
            userPhone.value = '081212121212';
            break;
          case '3':
            userEmail.value = 'masyarakatbiasa@gmail.com';
            userPhone.value = '081111111111';
            break;
          case '4':
            userEmail.value = 'akuwarga@yahoo.com';
            userPhone.value = '087654321980';
            break;
          case '5':
            userEmail.value = 'bandungjuara@newcity.go.id';
            userPhone.value = '088889999123';
            break;
          case '6':
            userEmail.value = 'chillwarga@gmail.com';
            userPhone.value = '088008800880';
            break;
        }
      } else {
        throw Exception('Failed to load username');
      }
    }
  }

  void updateName(String name) {
    userName.value = name;
  }

  void updateEmail(String email) {
    userEmail.value = email;
  }

  void updatePhone(String phone) {
    userPhone.value = phone;
  }

  void triggerUpdate() {
    updateFlag.value = !updateFlag.value;
  }

  /*void updateProfileImage(String path){
    profileImagePath.value = path;
  }*/
}
