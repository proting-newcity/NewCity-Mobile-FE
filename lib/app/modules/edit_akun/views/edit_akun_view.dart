import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newcity/models/user.dart';
import '../controllers/edit_akun_controller.dart';

class EditAkunView extends GetView<EditAkunController> {
  var user = Rx<User?>(null);

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
            //Obx((){
              //return 
              CircleAvatar(
              radius: 88,
              child: GestureDetector(onTap: () async {
                // buka kamera
                await controller.openCamera();
              }, child: Obx(() {
                if (controller.photo.value != null) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      File(controller.photo.value!.path),
                      fit: BoxFit.contain, // atur gambar di container
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt, color: Colors.green),
                      Text("Ubah Foto"),
                    ],
                  );
                }
              })),
              //child: Icon(Icons.person, size: 50),
              //backgroundImage: controller.profileImagePath.value.isEmpty? AssetImage('assets/default_profile.png'):FileImage(File(controller.profileImagePath.value)) as ImageProvider,
              
            ),
            //}),
            
            SizedBox(height: 15),
            Text(
              'Ubah foto',
              style: TextStyle(color: Color(0xFF588157)),
            ),
            SizedBox(height: 45),
            TextField(
                decoration: InputDecoration(
                  hintText: 'Nama',
                  prefixIcon: Icon(Icons.person_2_outlined),
                  border: OutlineInputBorder(),
                ),
                controller:
                    TextEditingController(text: user.value?.name),
                onChanged: (value) {
                  controller.updateName(value);
                }),
            SizedBox(height: 20),
            TextField(
                decoration: InputDecoration(
                  hintText: 'Username',
                  prefixIcon: Icon(Icons.mail),
                  border: OutlineInputBorder(),
                ),
                controller:
                    TextEditingController(text: user.value?.username),
                onChanged: (value) {
                  controller.updateUserName(value);
                }),
            SizedBox(height: 20),
            TextField(
                decoration: InputDecoration(
                  hintText: 'Telepon',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
                controller:
                    TextEditingController(text: user.value?.phone),
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
