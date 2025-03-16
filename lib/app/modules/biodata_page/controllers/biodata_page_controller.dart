//import 'package:http/http.dart' as http;
//import 'dart:convert';
import 'package:get/get.dart';
import 'package:newcity/api.dart';

class BiodataPageController extends GetxController {
  var userId = ''.obs;
  var userName = ''.obs;
  var userEmail = ''.obs;
  var userPhone = ''.obs;
  var profileImagePath = ''.obs;

  var updateFlag = false.obs;

  void setUserId(String id) {
    userId.value = id;
  }

  Future<void> fetchUserData() async {
    try {
      final profileData = await ApiService.fetchUserProfile(userId.value);
      if (profileData != null) {
        userName.value = profileData['name'] ?? '';
        userEmail.value = profileData['email'] ?? '';
        userPhone.value = profileData['phone'] ?? '';
        profileImagePath.value = profileData['profile_image'] ?? ''; // Optional
      } else {
        print('Failed to fetch user data');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
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

  void updateProfileImage(String imagePath) {
    profileImagePath.value = imagePath;
  }

  void triggerUpdate() {
    updateFlag.value = !updateFlag.value;
  }
}
