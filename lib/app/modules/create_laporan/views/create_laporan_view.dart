import 'dart:io';
import 'package:newcity/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/create_laporan_controller.dart';
import 'package:newcity/widgets/topic_chip.dart';

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
        title: Text(
          "Buat Laporan",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text("Laporan", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 18),
            Text("Judul"),
            TextField(
              controller: controller.judulController,
              decoration: InputDecoration(
                hintText: "Masukkan judul laporan",
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 2),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 18),
            Container(
              height: 150,
              decoration: BoxDecoration(
                  border: Border.all(color: primaryColor, width: 2),
                  borderRadius: BorderRadius.circular(10)),
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
                      Icon(Icons.camera_alt, color: greenColor),
                      Text("Unggah gambar/video"),
                    ],
                  );
                }
              })),
            ),
            SizedBox(height: 20),
            Text("Lokasi"),
            TextField(
              controller: controller.lokasiController,
              decoration: InputDecoration(
                hintText: "Masukkan lokasi",
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 2),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 18),
            Text("Deskripsi"),
            TextField(
              controller: controller.deskripsiController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Masukkan detail dari laporan mu disini",
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 2),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 20),
            Text("Pilih Topik", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (!controller.isUploading.value) {
                  controller.isUploading.value = true;
                  await controller.postReport();
                }
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: primaryColor),
              child: Text(
                "Berikutnya",
                style:
                    TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
