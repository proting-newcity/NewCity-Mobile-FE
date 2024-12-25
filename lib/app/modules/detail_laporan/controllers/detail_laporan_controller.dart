import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newcity/api.dart';
import 'package:newcity/models/report.dart';

class DetailLaporanController extends GetxController {
  var report = Rx<ReportResponse?>(null);
  Rx<int> likes = 0.obs;
  Rx<bool> isLiked = false.obs;
  Rx<bool> isBookmarked = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    fetchReport(Get.arguments);
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

  void fetchReport(int id) async {
    try {
      var response = await ApiService.getReport(id);
      report.value = response;
    } catch (e) {
      print('Error fetching berita: $e');
    }
  }

  void toggleLike() {
    if (isLiked.value) {
      likes.value--;
    } else {
      likes.value++;
    }
    isLiked.value = !isLiked.value;
  }

  void toggleBookmark() {
    isBookmarked.value = !isBookmarked.value;
  }

  List<dynamic> getStatusState(int indeks) {
    if (indeks == 1) {
      return [Color.fromRGBO(250, 178, 45, 1), 'Dalam Proses'];
    } else if (indeks == 2) {
      return [Color.fromRGBO(171, 192, 171, 1), 'Tindak Lanjut'];
    } else {
      return [Color.fromRGBO(58, 90, 64, 1), 'Selesai'];
    }
  }

  Future<void> addStatus(int id, String status) async {
    try {
      await ApiService.addStatus(id, status);
    } catch (e) {
      print(e);
    }
  }
}
