import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newcity/widgets/berita_tile.dart';

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
      body: Obx(() => ListView(
            children: [
              for (var index = 0;
                  index < controller.allBerita.value.berita.length;
                  index++)
                BeritaTile(
                  controller.allBerita.value.berita[index],
                  index,
                ),
            ],
          )),
    );
  }
}
