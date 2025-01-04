// edit_akun_controller.dart
import 'package:get/get.dart';

class EditAkunController extends GetxController {
  var userName = ''.obs;
  var userEmail = ''.obs;
  var userPhone = ''.obs;

  void updateName(String name) {
    userName.value = name;
  }

  void updateEmail(String email) {
    userEmail.value = email;
  }

  void updatePhone(String phone) {
    userPhone.value = phone;
  }
}
