import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import 'package:image_picker/image_picker.dart';
import 'package:newcity/services/report_service.dart';
import 'package:http_parser/http_parser.dart';
import 'package:newcity/models/report.dart';
import 'package:newcity/widgets/image_picker.dart';

class CreateLaporanController extends GetxController {
  Rx<XFile?> photo = Rx<XFile?>(null);
  final ImagePicker _picker = ImagePicker();
  var allKategori = Rx<KategoriReportResponse>(KategoriReportResponse());
  var isLoading = false.obs;
  var isUploading = false.obs;
  final TextEditingController judulController = TextEditingController();
  final TextEditingController teleponController = TextEditingController();
  final TextEditingController lokasiController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  Rx<int> selectedTopics = Rx<int>(-1);

  @override
  void onInit() {
    super.onInit();
    fetchKategori();
  }

  @override
  void onClose() {
    judulController.dispose();
    teleponController.dispose();
    lokasiController.dispose();
    deskripsiController.dispose();
    super.onClose();
  }

  void clearForm() {
    judulController.clear();
    teleponController.clear();
    lokasiController.clear();
    deskripsiController.clear();
    photo.value = null;
    selectedTopics.value = -1;
  }

  void showImageSourceOptions(BuildContext context) {
    showImagePickerModal(context, pickImage);
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        photo.value = pickedFile;
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to pick image: $e");
    }
  }

  void fetchKategori() async {
    try {
      var response = await ReportService.getKategoriReport();
      allKategori.value = response!;
    } catch (e) {
      print('Error fetching Kategori: $e');
    }
  }

  Future<void> postReport() async {
    if (photo.value == null) {
      Get.snackbar("Error", "Please select an image!",
          snackPosition: SnackPosition.BOTTOM);
      isUploading.value = false;
      return;
    }

    if (judulController.text.isEmpty ||
        lokasiController.text.isEmpty ||
        deskripsiController.text.isEmpty ||
        selectedTopics.isNegative) {
      Get.snackbar("Error", "Please fill in all required fields!",
          snackPosition: SnackPosition.BOTTOM);
      isUploading.value = false;
      return;
    }

    try {
      isLoading.value = true;
      dio.FormData formData = dio.FormData();
      formData.fields.addAll([
        MapEntry("judul", judulController.text),
        MapEntry("deskripsi", deskripsiController.text),
        MapEntry("lokasi", lokasiController.text),
        MapEntry("id_kategori",
            allKategori.value.kategori[selectedTopics.value].id.toString()),
      ]);
      final multipartFile = await dio.MultipartFile.fromFile(
        photo.value!.path,
        filename: photo.value!.name,
        contentType: MediaType('image', 'jpeg'),
      );
      formData.files.add(MapEntry("foto", multipartFile));
      final response = await ReportService.postReport(formData);
      if (response != null &&
          (response.statusCode == 200 || response.statusCode == 201)) {
        Get.snackbar("Success", "Report submitted successfully!",
            snackPosition: SnackPosition.BOTTOM);
        Get.offAllNamed('/dashboard');
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
      isUploading.value = false;
    }
  }
}
