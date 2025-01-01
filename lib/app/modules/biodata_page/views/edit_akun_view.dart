import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/biodata_page_controller.dart';

class EditAkunView extends GetView<BiodataPageController> {
  final BiodataPageController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Akun'),
        backgroundColor: Color(0xFF588157),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Nama'),
              controller: TextEditingController(text: controller.userName.value),
              onChanged: (value) {
                controller.updateName(value);
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
              controller: TextEditingController(text: controller.userEmail.value),
              onChanged: (value) {
                controller.updateEmail(value);
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Telepon'),
              controller: TextEditingController(text: controller.userPhone.value),
              onChanged: (value) {
                controller.updatePhone(value);
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Save changes and navigate back
                Get.back();
              },
              child: Text('Simpan Perubahan'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF588157),
              ),
            ),
          ],
        ),
      ),
    );
  }
}