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
        automaticallyImplyLeading: false,

        // title: const Text(
        //   "Buat Laporan",
        //   style: boldPrimaryColor14,
        // ),

        title: Row(
          children: [
            Image.asset(
              'assets/images/logo_NewCity_Original.png',
              width: 30,
            ),
            const SizedBox(width: 20),
            const Text("Buat Laporan", style: boldPrimaryColor14),
            // Placeholder for alignment
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
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
              child: GestureDetector(
                onTap: () {
                  controller.showImageSourceOptions(context);
                },
                child: Obx(() {
                  if (controller.photo.value != null) {
                    return ClipRRect(
                      borderRadius: borderLgCircular,
                      child: Image.file(
                        File(controller.photo.value!.path),
                        fit: BoxFit.cover,
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
                }),
              ),
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
              if (controller.allKategori.value.kategori.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }
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
            Obx(() => ElevatedButton(
                  onPressed: controller.isUploading.value
                      ? null // Disable button while uploading
                      : () async {
                          await controller.postReport();
                        },
                  child: controller.isUploading.value
                      ? CircularProgressIndicator(color: Colors.white)
                      : const Text("Berikutnya", style: boldWhite14),
                )),
          ],
        ),
      ),
    );
  }
}
