import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:newcity/services/auth_service.dart';

class ForgotPasswordController extends GetxController {
  //TODO: Implement ForgotPasswordController
  TextEditingController notelpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final otp = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void sendOtp() {
    int number = Random().nextInt(9999);
    while (number < 1000) {
      number *= 10;
    }
    otp.value = number;
    print(otp.value);
    Get.toNamed('/new-password');
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 11,
        channelKey: 'basic_channel',
        title: 'Kode Verifikasi Password',
        body: 'Kode OTP anda adalah ${otp.value}',
      ),
    );
  }

  void nextRoute(pin) async {
    if (otp.value == int.parse(pin)) {
      try {
        Get.toNamed('/new-password');
      } catch (e) {
        print('Error register berita: $e');
      }
    }
  }

  void searchnotelp() async {
    try {
      final response =
          await AuthService.getMasyarakatByPhone(notelpController.text);
      print(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        sendOtp();
        Get.toNamed('/kode-verifikasi');
      }
    } catch (e) {
      Get.snackbar(
        'Gagal',
        'Nomor telepon tidak terdaftar',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void changePassword() async {
    if (passwordController.text != passwordConfirmationController.text) {
      Get.snackbar(
        'Gagal',
        'Kata sandi tidak sama',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      final response = await AuthService.changePassword(
          notelpController.text, passwordController.text);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar(
          'Berhasil',
          'Kata sandi berhasil diubah',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.toNamed('/login');
      }
    } catch (e) {
      Get.snackbar(
        'Gagal',
        'Kata sandi gagal diubah',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
