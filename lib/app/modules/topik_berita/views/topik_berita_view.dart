import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newcity/api.dart';
import 'package:newcity/model.dart';

import '../controllers/topik_berita_controller.dart';

class TopikBeritaView extends GetView<TopikBeritaController> {
  const TopikBeritaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Get.arguments.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(
        () => controller.allBerita.value.berita != null
            ? ListView(
                children: [
                  for (var index = 0;
                      index < controller.allBerita.value.berita.length;
                      index++)
                    _beritaTile(
                      controller.allBerita.value.berita[index],
                      index,
                    ),
                ],
              )
            : Wrap(),
      ),
    );
  }
}

_beritaTile(Berita beritaData, index) {
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
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: ApiService.loadImage(beritaData.foto),
                  fit: BoxFit.cover,
                ),
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
                    beritaData.title,
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
