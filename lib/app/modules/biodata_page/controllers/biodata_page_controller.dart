import 'package:get/get.dart';

class BiodataPageController extends GetxController {
  var userName = 'kalel'.obs;
  var userEmail = 'kalpratama@gmail.com'.obs;
  var userPhone = '081234567890'.obs;

  void updateName(String name) {
    userName.value = name;
  }

  void updateEmail(String email) {
    userEmail.value = email;
  }

  void updatePhone(String phone) {
    userPhone.value = phone;
  }

  // Method to log out
  void logout() {
    // Implement logout logic here
  }
}
