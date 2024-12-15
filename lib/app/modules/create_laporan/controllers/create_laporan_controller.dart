import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:newcity/api.dart';
import 'package:newcity/camera.dart';
import 'package:http_parser/http_parser.dart';
import 'package:newcity/models/report.dart';

class CreateLaporanController extends GetxController {
  var allKategori = Rx<KategoriReportResponse>(KategoriReportResponse());
  Rx<XFile?> photo = Rx<XFile?>(null);
  var isLoading = false.obs;

  final TextEditingController judulController = TextEditingController();
  final TextEditingController teleponController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController lokasiController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  Rx<int> selectedTopics = Rx<int>(-1);

  @override
  void onInit() {
    super.onInit();
    fetchKategori();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchKategori() async {
    try {
      var response = await ApiService.getKategoriReport();
      allKategori.value = response!;
      print(allKategori.value.kategori.length);
    } catch (e) {
      print('Error fetching Kategori: $e');
    }
  }

  Future<void> openCamera() async {
    setUpCameraDelegate();

    final cameraDelegate = MyCameraDelegate();
    photo.value = await cameraDelegate.takePhoto();

    if (photo.value != null) {
      print('Photo taken: ${photo.value!.path}');
    } else {
      print('No photo taken or user canceled');
    }
  }

  Future<void> postReport() async {
    if (photo.value == null) {
      Get.snackbar("Error", "Please select an image!",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (judulController.text.isEmpty ||
        lokasiController.text.isEmpty ||
        deskripsiController.text.isEmpty ||
        selectedTopics.isNegative) {
      Get.snackbar("Error", "Please fill in all required fields!",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {
      isLoading.value = true;

      dio.FormData formData = dio.FormData();
      formData.fields.addAll([
        MapEntry("judul", judulController.text),
        MapEntry("deskripsi", deskripsiController.text),
        MapEntry("lokasi", lokasiController.text),
        MapEntry("status[]", '["open"]'),
        MapEntry("id_masyarakat", "1"), // Replace with actual value
        MapEntry("id_kategori",
            allKategori.value.kategori[selectedTopics.value].id.toString()),
      ]);

      formData.files.add(MapEntry(
        "foto",
        await dio.MultipartFile.fromFile(
          photo.value!.path,
          filename: photo.value!.name,
          contentType: MediaType('image', 'jpeg'),
        ),
      ));

      print('Form Data: ${formData.fields}');
      print('Form Files: ${formData.files}');

      final response = await ApiService.postReport(formData);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar("Success", "Report submitted successfully!",
            snackPosition: SnackPosition.BOTTOM);
        clearForm();
      } else {
        Get.snackbar("Error", "Failed to submit report.",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print("Error posting report: $e");
      Get.snackbar("Error", "Something went wrong. Please try again.",
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  void clearForm() {
    judulController.clear();
    teleponController.clear();
    emailController.clear();
    lokasiController.clear();
    deskripsiController.clear();
    photo.value = null;
    selectedTopics.value = -1;
  }
}
