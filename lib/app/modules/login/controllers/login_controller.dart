import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newcity/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
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
      final response = await AuthService.login(
          usernameController.text, passwordController.text);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final prefs = await SharedPreferences.getInstance();
        final String role = response.data['role'];
        print("asjlddasadsasdsaddsasad:   " + role);
        await prefs.setString('userRole', role);

        Get.snackbar("Success", "Login success!",
            snackPosition: SnackPosition.BOTTOM);
        if (response.data['role'] == 'masyarakat') {
          Get.toNamed("/dashboard");
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
}
