import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/topik_berita_controller.dart';

class TopikBeritaView extends GetView<TopikBeritaController> {
  const TopikBeritaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Get.arguments.judul,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(
        () => controller.allBerita.value.berita != null
            ? ListView(
                children: [
                  for (var index = 0;
                      index <
                          controller
                              .getBeritaByKategori(Get.arguments.judul)
                              .length;
                      index++)
                    _beritaTile(
                      controller
                          .getBeritaByKategori(Get.arguments.judul)[index],
                      index,
                    ),
                ],
              )
            : Wrap(),
      ),
    );
  }
}

_beritaTile(beritaData, index) {
  return GestureDetector(
    onTap: () {
      Get.toNamed('/detail-berita', arguments: beritaData);
    },
    child: Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Placeholder gambar
            CircleAvatar(
              backgroundColor: Colors.red,
              radius: 40,
              child: Icon(
                Icons.article,
                color: Colors.white,
                size: 30,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            // Text section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    beritaData.judul,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    DateFormat('yyyy-MM-dd – kk:mm').format(beritaData.tanggal),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
