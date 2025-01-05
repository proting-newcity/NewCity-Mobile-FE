import 'package:get/get.dart';

class BiodataPageController extends GetxController {
  // Observables to manage state
  var userName = 'akunSaya'.obs;
  var userEmail = 'akunsayapertama@gmail.com'.obs;
  var userPhone = '+62 8123-4567-9810'.obs;

  // Methods to update the user data
  void updateName(String newName) {
    userName.value = newName;
  }

  void updateEmail(String newEmail) {
    userEmail.value = newEmail;
  }

  void updatePhone(String newPhone) {
    userPhone.value = newPhone;
  }

  // Method to log out
  void logout() {
    // Implement logout logic here
  }
}
