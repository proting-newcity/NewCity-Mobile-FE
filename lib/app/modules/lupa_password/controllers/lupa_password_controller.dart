import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

import 'package:newcity/services/auth_service.dart';

class LupaPasswordController extends GetxController {
  final TextEditingController namacontroller = TextEditingController();
  final TextEditingController notelpcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final otp = 0.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void sendOtp() {
    otp.value = Random().nextInt(9999) + 1000;
    print(otp.value);
    Get.toNamed('/otp');
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: 'basic_channel',
        title: 'Kode OTP',
        body: 'Kode OTP anda adalah ${otp.value}',
      ),
    );
  }

  void register(pin) async {
    if (otp.value == int.parse(pin)) {
      try {
        var response = await AuthService.register(
          namacontroller.text,
          notelpcontroller.text,
          passwordcontroller.text,
        );
        Get.toNamed('/login');
        print(response);
      } catch (e) {
        print('Error register berita: $e');
      }
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

  void increment() => count.value++;
}
