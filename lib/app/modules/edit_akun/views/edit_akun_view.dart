import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newcity/services/image_service.dart';
import '../controllers/edit_akun_controller.dart';
import 'package:newcity/themes/colors.dart';
import 'package:newcity/themes/text_theme.dart';
import 'package:newcity/themes/radius.dart';
import 'package:newcity/themes/size_box.dart';

class EditAkunView extends GetView<EditAkunController> {
  EditAkunView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Akun')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            sBoxh5,
            Obx(() {
              if (controller.photo.value != null) {
                return GestureDetector(
                  onTap: () {
                    controller.showImageSourceOptions(context);
                  },
                  child: CircleAvatar(
                    radius: 88,
                    backgroundImage:
                        FileImage(File(controller.photo.value!.path)),
                  ),
                );
              }

              return FutureBuilder<ImageProvider>(
                future: ImageService.loadImage(Get.arguments.foto),
                builder: (ctx, snap) {
                  if (snap.connectionState == ConnectionState.waiting) {
                    return CircleAvatar(
                      radius: 88,
                      backgroundColor: Colors.grey[200],
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(greenColor),
                      ),
                    );
                  }
                  if (snap.hasError || snap.data == null) {
                    return GestureDetector(
                      onTap: () {
                        controller.showImageSourceOptions(context);
                      },
                      child: CircleAvatar(
                        radius: 88,
                        backgroundImage:
                            const AssetImage('assets/placeholder.png'),
                      ),
                    );
                  }
                  return GestureDetector(
                    onTap: () {
                      controller.showImageSourceOptions(context);
                    },
                    child: CircleAvatar(
                      radius: 88,
                      backgroundImage: snap.data,
                    ),
                  );
                },
              );
            }),
            sBoxh15,
            Text('Ubah foto', style: regularPrimaryColor14),
            sBoxh45,
            Text("Nama"),
            TextField(
              controller: controller.nameController,
              decoration: InputDecoration(
                hintText: "Masukkan nama",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 2),
                  borderRadius: borderLgCircular,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 2),
                  borderRadius: borderLgCircular,
                ),
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
                  borderRadius: borderLgCircular,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 2),
                  borderRadius: borderLgCircular,
                ),
              ),
            ),
            sBoxh20,
            ElevatedButton(
              onPressed: controller.saveChanges,
              child: const Text('Simpan Perubahan', style: normalWhite14),
            ),
          ],
        ),
      ),
    );
  }
}
