import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/edit_akun_controller.dart';
import 'dart:io';

class EditAkunView extends GetView<EditAkunController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Akun'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 5),
            Obx(() {
              return CircleAvatar(
                radius: 88,
                backgroundImage: controller.profileImagePath.value.isEmpty
                    ? AssetImage('assets/default_profile.png')
                    : FileImage(File(controller.profileImagePath.value)) as ImageProvider,
                child: controller.profileImagePath.value.isEmpty
                    ? Icon(Icons.person, size: 50)
                    : null,
              );
            }),
            
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                controller.pickImage();
              },
              child: Text(
                'Ubah foto',
                style: TextStyle(color: Color(0xFF588157), decoration: TextDecoration.underline),
              ),
            ),
            SizedBox(height: 45),
            TextField(
                decoration: InputDecoration(
                  hintText: 'Nama',
                  prefixIcon: Icon(Icons.person_2_outlined),
                  border: OutlineInputBorder(),
                ),
                controller:
                    TextEditingController(text: controller.userName.value),
                onChanged: (value) {
                  controller.updateName(value);
                }),
            SizedBox(height: 20),
            TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.mail),
                  border: OutlineInputBorder(),
                ),
                controller:
                    TextEditingController(text: controller.userEmail.value),
                onChanged: (value) {
                  controller.updateEmail(value);
                }),
            SizedBox(height: 20),
            TextField(
                decoration: InputDecoration(
                  hintText: 'Telepon',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
                controller:
                    TextEditingController(text: controller.userPhone.value),
                onChanged: (value) {
                  controller.updatePhone(value);
                }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.saveChanges();
                Get.back();
              },
              child: Text('Simpan Perubahan',
                style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF588157),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
