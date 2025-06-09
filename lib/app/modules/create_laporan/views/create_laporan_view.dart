import 'dart:io';
import 'package:newcity/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/create_laporan_controller.dart';
import 'package:newcity/widgets/topic_chip.dart';
import 'package:newcity/themes/text_theme.dart';
import 'package:newcity/themes/radius.dart';
import 'package:newcity/themes/size_box.dart';

class CreateLaporanView extends GetView<CreateLaporanController> {
  const CreateLaporanView({super.key});

  @override
  Widget build(BuildContext context) {
    final CreateLaporanController controller =
        Get.put(CreateLaporanController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Buat Laporan",
          style: boldBlack14,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text("Laporan", style: boldBlack14),
            sBoxh18,
            Text("Judul"),
            TextField(
              controller: controller.judulController,
              decoration: InputDecoration(
                hintText: "Masukkan judul laporan",
              ),
            ),
            sBoxh18,
            Container(
              height: 150,
              decoration: BoxDecoration(
                  border: Border.all(color: primaryColor, width: 1),
                  borderRadius: borderLgCircular),
              child: GestureDetector(onTap: () async {
                // buka kamera
                await controller.openCamera();
              }, child: Obx(() {
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
                      Text("Unggah gambar/video"),
                    ],
                  );
                }
              })),
            ),
            sBoxh20,
            Text("Lokasi"),
            TextField(
              controller: controller.lokasiController,
              decoration: InputDecoration(hintText: "Masukkan lokasi"),
            ),
            sBoxh18,
            Text("Deskripsi"),
            TextField(
              controller: controller.deskripsiController,
              maxLines: 5,
              decoration: InputDecoration(
                  hintText: "Masukkan detail dari laporan mu disini"),
            ),
            sBoxh20,
            const Text("Pilih Topik", style: boldBlack14),
            sBoxh10,
            Obx(() {
              return Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: List<Widget>.generate(
                    controller.allKategori.value.kategori.length, (int index) {
                  return TopicChip(
                      controller.allKategori.value.kategori[index].name,
                      index,
                      controller.selectedTopics);
                }),
              );
            }),
            sBoxh20,
            ElevatedButton(
              onPressed: () async {
                if (!controller.isUploading.value) {
                  controller.isUploading.value = true;
                  await controller.postReport();
                }
              },
              child: const Text("Berikutnya", style: boldWhite14),
            ),
          ],
        ),
      ),
    );
  }
}
