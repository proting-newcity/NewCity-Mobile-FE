import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:newcity/model.dart';

class TopikBeritaController extends GetxController {
  var allBerita = Rx<BeritaResponse>(BeritaResponse());
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
}
