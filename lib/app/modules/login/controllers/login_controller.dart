import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newcity/api.dart';
import 'package:newcity/app/modules/beranda/bindings/beranda_binding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxString userRole = ''.obs; // Role disimpan sebagai reactive variable
  @override
  void onInit() {
    super.onInit();
    loadUserRole(); // Ambil role saat controller pertama kali dibuat
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> loadUserRole() async {
    final prefs = await SharedPreferences.getInstance();
    userRole.value =
        prefs.getString('userRole') ?? ''; // Default kosong jika tidak ada
  }

  Future<void> login() async {
    try {
      final response = await ApiService.login(
          usernameController.text, passwordController.text);
      print(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Simpan role ke SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userRole', response.data['role']);

        // Set state di GetX
        userRole.value = response.data['role'];

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
}
