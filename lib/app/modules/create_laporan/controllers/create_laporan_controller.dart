import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:newcity/api.dart';
import 'package:newcity/camera.dart';
import 'package:http_parser/http_parser.dart';

class CreateLaporanController extends GetxController {
  Rx<XFile?> photo = Rx<XFile?>(null);
  var isLoading = false.obs;

  final TextEditingController judulController = TextEditingController();
  final TextEditingController teleponController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController lokasiController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final selectedTopics = <String>[].obs;

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

  Future<void> openCamera() async {
    // Set up the camera delegate if it's not already set
    setUpCameraDelegate();

    final cameraDelegate = MyCameraDelegate(); // Create the camera delegate
    // Call takePhoto() to open the camera and take a photo
    photo.value = await cameraDelegate.takePhoto();

    // Log the photo path or handle cancellation
    if (photo.value != null) {
      print('Photo taken: ${photo.value!.path}');
    } else {
      print('No photo taken or user canceled');
    }
  }

  // Function to post the report
  Future<void> postReport() async {
    if (photo.value == null) {
      Get.snackbar("Error", "Please select an image!",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (judulController.text.isEmpty ||
        lokasiController.text.isEmpty ||
        deskripsiController.text.isEmpty) {
      Get.snackbar("Error", "Please fill in all required fields!",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {
      isLoading.value = true;

      // Prepare form data
      dio.FormData formData = dio.FormData();
      formData.fields.addAll([
        MapEntry("judul", judulController.text),
        MapEntry("deskripsi", deskripsiController.text),
        MapEntry("lokasi", lokasiController.text),
        MapEntry("status[]", '["open"]'),
        MapEntry("id_masyarakat", "1"), // Replace with actual value
        MapEntry("id_kategori", "1"), // Replace with actual value
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

      // Make POST request
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
    selectedTopics.clear();
  }
}
