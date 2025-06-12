import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:image_picker/image_picker.dart';
import 'package:newcity/app/modules/biodata_page/controllers/biodata_page_controller.dart';
import 'package:http_parser/http_parser.dart';
import 'package:newcity/services/user_service.dart';
import 'package:newcity/widgets/image_picker.dart';

class EditAkunController extends GetxController {
  Rx<XFile?> photo = Rx<XFile?>(null);
  final ImagePicker _picker = ImagePicker();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  final BiodataPageController biodataController =
      Get.find<BiodataPageController>();

  @override
  void onInit() {
    super.onInit();
    nameController.text = Get.arguments.name;
    usernameController.text = Get.arguments.username;
  }

  @override
  void onClose() {
    super.onClose();
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

  Future<void> saveChanges() async {
    try {
      dio.FormData formData = dio.FormData();
      formData.fields.addAll([
        MapEntry("name", nameController.text),
        MapEntry("username", usernameController.text),
      ]);

      if (photo.value != null) {
        final multipartFile = await dio.MultipartFile.fromFile(
          photo.value!.path,
          filename: photo.value!.name,
          contentType: MediaType('image', 'jpeg'),
        );
        formData.files.add(MapEntry("foto", multipartFile));
      }

      final response = await UserService.updateUser(formData);

      if (response != null &&
          (response.statusCode == 200 || response.statusCode == 201)) {
        print(response.data);
        Get.snackbar("Success", "Report submitted successfully!",
            snackPosition: SnackPosition.BOTTOM);
        Get.toNamed('/dashboard');
      } else {
        Get.snackbar("Error", "Failed to submit report.",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print("Error posting report: $e");
      Get.snackbar("Error", "Something went wrong. Please try again.",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
