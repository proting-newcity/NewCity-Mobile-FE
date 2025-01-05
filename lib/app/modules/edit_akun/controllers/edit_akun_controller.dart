import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newcity/app/modules/biodata_page/controllers/biodata_page_controller.dart';

class EditAkunController extends GetxController {
  var userName = ''.obs;
  var userEmail = ''.obs;
  var userPhone = ''.obs;
  //var profileImagePath = ''.obs;

  final BiodataPageController biodataController = Get.find<BiodataPageController>();

  @override
  void onInit() {
    super.onInit();
    userName.value = biodataController.userName.value;
    userEmail.value = biodataController.userEmail.value;
    userPhone.value = biodataController.userPhone.value;
  }

  void updateName(String name) {
    userName.value = name;
  }

  void updateEmail(String email) {
    userEmail.value = email;
  }

  void updatePhone(String phone) {
    userPhone.value = phone;
  }

  void saveChanges() {
    print("Saving Changes: Name: ${userName.value}, Email: ${userEmail.value}, Phone: ${userPhone.value}");
    biodataController.updateName(userName.value);
    biodataController.updateEmail(userEmail.value);
    biodataController.updatePhone(userPhone.value);
    //biodataController.fetchUserData();
    //biodataController.triggerUpdate();
  }

  /*Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null){
      profileImagePath.value = image.path;
      final BiodataPageController biodataPageController = Get.find<BiodataPageController>();
      biodataPageController.updateProfileImage(image.path)
    }
  }*/
}
