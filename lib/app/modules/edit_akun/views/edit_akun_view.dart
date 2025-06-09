import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newcity/models/user.dart';
import '../controllers/edit_akun_controller.dart';
import 'package:newcity/themes/colors.dart';
import 'package:newcity/themes/text_theme.dart';
import 'package:newcity/themes/radius.dart';
import 'package:newcity/themes/size_box.dart';

// ignore: must_be_immutable
class EditAkunView extends GetView<EditAkunController> {
  var user = Rx<User?>(null);

  EditAkunView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Akun'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sBoxh5,
            //Obx((){
            //return
            CircleAvatar(
              radius: 88,
              child: GestureDetector(onTap: () async {
                // buka kamera
                await controller.openCamera();
              }, child: Obx(() {
                // TODO update biar load gambar dari API (ini salah)
                if (controller.photo.value != null) {
                  return ClipRRect(
                    borderRadius: borderLgCircular,
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
                      const Icon(Icons.camera_alt, color: greenColor),
                      Text("Ubah Foto"),
                    ],
                  );
                }
              })),
              //child: Icon(Icons.person, size: 50),
              //backgroundImage: controller.profileImagePath.value.isEmpty? AssetImage('assets/default_profile.png'):FileImage(File(controller.profileImagePath.value)) as ImageProvider,
            ),
            //}),

            sBoxh15,
            Text(
              'Ubah foto',
              style: regularPrimaryColor14,
            ),
            sBoxh45,
            Text("Nama"),
            TextField(
              controller: controller.nameController,
              decoration: InputDecoration(
                hintText: "Masukkan nama",
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 2),
                    borderRadius: borderLgCircular),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: primaryColor, width: 2),
                    borderRadius: borderLgCircular),
              ),
            ),
            sBoxh20,
            Text("Nomor Telepon"),
            TextField(
              controller: controller.usernameController,
              decoration: InputDecoration(
                hintText: "Masukkan nomor telepon",
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 2),
                    borderRadius: borderLgCircular),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: primaryColor, width: 2),
                    borderRadius: borderLgCircular),
              ),
            ),
            sBoxh20,
            ElevatedButton(
              onPressed: () {
                controller.saveChanges();
              },
              child: const Text('Simpan Perubahan', style: normalWhite14),
            ),
          ],
        ),
      ),
    );
  }
}
