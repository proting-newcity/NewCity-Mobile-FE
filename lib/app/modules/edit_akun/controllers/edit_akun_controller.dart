import 'package:get/get.dart';
import "package:newcity/models/user.dart";
import 'package:dio/dio.dart' as dio;
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:newcity/app/modules/biodata_page/controllers/biodata_page_controller.dart';
import 'package:newcity/camera.dart';
import 'package:http_parser/http_parser.dart';
import 'package:newcity/services/user_service.dart';

class EditAkunController extends GetxController {
  var user = Rx<User?>(null);
  Rx<XFile?> photo = Rx<XFile?>(null);

  final BiodataPageController biodataController =
      Get.find<BiodataPageController>();

  @override
  void onInit() {
    super.onInit();
    user.value?.name;
    user.value?.username;
    user.value?.phone;
    user.value?.profilePhoto;
  }

  @override 
  void onClose(){
    super.onClose();
  }

  void updateName(String name) {
    user.value?.name = name;
  }

  void updateUserName(String username){
    user.value?.username = username;
  }

  void updatePhone(String phone) {
    user.value?.phone = phone;
  }

  Future <void> saveChanges() async {
    print("Saving Changes: Name: ${user.value?.name}, Phone: ${user.value?.phone}");

    try{
      final response = await UserService.postProfile('name', 'username', 'phone');

      if (response != null &&
          (response.statusCode == 200 || response.statusCode == 201)) {
        Get.snackbar("Success", "Changes saved successfully!",
            snackPosition: SnackPosition.BOTTOM);
        Get.toNamed('/beranda');
      } else {
        Get.snackbar("Error", "Failed to save changes.",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch(e){
      print("Error saving changes: $e");
      Get.snackbar("Error", "Something went wrong. Please try again.",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> openCamera() async {
    setUpCameraDelegate();

    final cameraDelegate = MyCameraDelegate();
    photo.value = await cameraDelegate.takePhoto();
  }

  Future<void> pickImage() async {
    final multipartFile = await dio.MultipartFile.fromFile(
        photo.value!.path,
        filename: photo.value!.name,
        contentType: MediaType('image', 'jpeg'),
      );

    final BiodataPageController biodataPageController = Get.find<BiodataPageController>();
    biodataPageController.updateProfileImage();

    //final XFile? image = await _picker.Image(source: ImageSource.gallery);
    // if (image != null){
    //   photo.value!.path;
    // }
  }
}
