import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newcity/widgets/berita_tile.dart';
import 'package:newcity/theme/text_theme.dart';
import '../controllers/topik_berita_controller.dart';

class TopikBeritaView extends GetView<TopikBeritaController> {
  const TopikBeritaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.arguments.name, style: boldText),
      ),
      body: Obx(
        () {
          if (controller.allBerita.value.berita.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }

          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (!controller.isLoading.value &&
                  scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                controller.fetchBeritaByKategori(Get.arguments.id);
              }
              return true;
            },
            child: ListView.builder(
              itemCount: controller.allBerita.value.berita.length +
                  (controller.hasReachedEnd.value
                      ? 0
                      : 1), // Add extra item for loading indicator
              itemBuilder: (context, index) {
                if (index < controller.allBerita.value.berita.length) {
                  return BeritaTile(
                    controller.allBerita.value.berita[index],
                    index,
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          );
        },
      ),
    );
  }
}
