import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';

class BiodataPageController extends GetxController {
  var userId = ''.obs;
  var userName = ''.obs;
  var userEmail = ''.obs;
  var userPhone = ''.obs;

  var updateFlag = false.obs;

  void setUserId(String id) {
    userId.value = id;
  }

  Future<void> fetchUserData() async {
    if (userName.value.isEmpty || userEmail.value.isEmpty || userPhone.value.isEmpty) {
      final response = await http.get(Uri.parse(
          'http://10.0.2.2/newcity/fetchUsername.php?id=${userId.value}'));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        userName.value = data['username'];

        switch (userId.value) {
          case '1':
            userName.value = 'kalpratama';
            userEmail.value = 'null@mail.com';
            userPhone.value = '080000000009';
            break;
          case '2':
            userEmail.value = 'fionadhilla17@gmail.com';
            userPhone.value = '081212121212';
            break;
          case '3':
            userEmail.value = 'masyarakatbiasa@gmail.com';
            userPhone.value = '081111111111';
            break;
          case '4':
            userEmail.value = 'akuwarga@yahoo.com';
            userPhone.value = '087654321980';
            break;
          case '5':
            userEmail.value = 'bandungjuara@newcity.go.id';
            userPhone.value = '088889999123';
            break;
          case '6':
            userEmail.value = 'chillwarga@gmail.com';
            userPhone.value = '088008800880';
            break;
        }
      } else {
        throw Exception('Failed to load username');
      }
    }

    print("CONT Data: $userName, $userEmail");
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

  void triggerUpdate() {
    updateFlag.value = !updateFlag.value;
  }
}
