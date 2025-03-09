import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newcity/api.dart';
import 'package:newcity/app/modules/beranda/bindings/beranda_binding.dart';
import 'package:newcity/app/modules/biodata_page/controllers/biodata_page_controller.dart';


class LoginController extends GetxController {
    var userId = ''.obs;
    
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> login() async {
    try {
      final response = await ApiService.login(
          usernameController.text, passwordController.text);
      print(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar("Success", "Login success!",
            snackPosition: SnackPosition.BOTTOM);
        if (response.data['role'] == 'masyarakat') {
          Get.toNamed("/beranda");
        } else {
          Get.toNamed("/government");
        }
      }
    } catch (e) {
      print("Error Login: $e");
      Get.snackbar("Error", "Something went wrong. Please try again.",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> fetchUserProfile(String userId) async {
    try {
      var userData = await ApiService.fetchUserProfile(userId);
      final BiodataPageController biodataController = Get.find<BiodataPageController>();
      biodataController.updateName(userData['username']);
      biodataController.updateEmail(userData['email']);
      biodataController.updatePhone(userData['phone']);
      biodataController.updateProfileImage(userData['profile_image']);
    } catch (e) {
      print("Error fetching user profile: $e");
    }
  }
}
