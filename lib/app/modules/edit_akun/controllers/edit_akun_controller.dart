import 'package:get/get.dart';
import 'package:newcity/app/modules/biodata_page/controllers/biodata_page_controller.dart';

class EditAkunController extends GetxController {
  var userName = ''.obs;
  var userEmail = ''.obs;
  var userPhone = ''.obs;

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

  void saveChanges(String userId) {
    print("Saving Changes: Name: ${userName.value}, Email: ${userEmail.value}, Phone: ${userPhone.value}");
    biodataController.updateName(userName.value);
    biodataController.updateEmail(userEmail.value);
    biodataController.updatePhone(userPhone.value);
    //biodataController.fetchUserData();
    //biodataController.triggerUpdate();

    /*final response = await http.post(
      Uri.parse('http://10.0.2.2/newcity/fetchUsername.php'),
      body: {
        'id' : userId,
        'username': userName.value,
        'email' : userEmail.value,
        'phone' : userPhone.value,
      },
    );

    print('Raw response: ${response.body}');

    if (response.statusCode == 200){
      var data = jsonDecode(response.body);
      if (data['status'] == 'success'){
        print("Successfully updated database");
      } else {
        print("Failed to update database");
      }
    } else {
      throw Exception('Failed to update user details');
    }*/
  }
}
