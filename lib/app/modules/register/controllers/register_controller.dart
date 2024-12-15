import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newcity/api.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController

  final TextEditingController namacontroller = TextEditingController();
  final TextEditingController notelpcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void Register() async {
    try {
      var response = await ApiService.register(
        namacontroller.text,
        notelpcontroller.text,
        passwordcontroller.text,
      );
      print(response);
    } catch (e) {
      print('Error register berita: $e');
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
