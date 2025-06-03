import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newcity/services/image_service.dart';
import 'package:newcity/widgets/berita_tile.dart';
import '../controllers/list_berita_controller.dart';
import 'package:newcity/models/berita.dart';
import 'package:newcity/theme/colors.dart';
import 'package:newcity/theme/text_theme.dart';
import 'package:newcity/theme/radius.dart';

class ListBeritaView extends GetView<ListBeritaController> {
  const ListBeritaView({super.key});
  Future<List<ImageProvider<Object>>> loadCategoryImages(
      List<KategoriBerita> kategoriList) async {
    List<Future<ImageProvider<Object>>> futures = [];

    for (var kategori in kategoriList) {
      futures.add(ImageService.loadImage(kategori.foto));
    }

    return await Future.wait(futures);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Berita",
          style: boldBlack14,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Topik Terkenal", style: boldBlack20),
                TextButton(
                  onPressed: () {
                    Get.toNamed("/list-topik-berita");
                  },
                  child: const Text("Topik lainnya", style: boldGreen15),
                )
              ],
            ),
          ),
          _appBarTopik(), // Only listens to topik observables
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: const Text("Berita Untukmu", style: boldBlack20),
          ),
          Expanded(
            child: Obx(
              () {
                if (controller.allBerita.value.berita.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                }

                return NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (!controller.isLoading.value &&
                        scrollInfo.metrics.pixels ==
                            scrollInfo.metrics.maxScrollExtent) {
                      controller.fetchBerita();
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
          ),
        ],
      ),
    );
  }

  Widget _appBarTopik() {
    return Obx(() {
      if (controller.allKategori.value.kategori.isEmpty) {
        return Center(child: CircularProgressIndicator());
      }
      return FutureBuilder<List<ImageProvider<Object>>>(
        future: loadCategoryImages(controller.allKategori.value.kategori),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Error loading images"));
          } else if (!snapshot.hasData) {
            return const Center(child: Text("No data available"));
          } else {
            List<ImageProvider<Object>> categoryImages = snapshot.data ?? [];

            return SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.allKategori.value.kategori.length,
                itemBuilder: (context, index) {
                  return _topikTile(
                      controller.allKategori.value.kategori[index],
                      categoryImages[index]);
                },
              ),
            );
          }
        },
      );
    });
  }

  Widget _topikTile(KategoriBerita kategori, ImageProvider<Object> image) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/topik-berita', arguments: kategori);
      },
      child: Container(
        width: 150,
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: image,
            fit: BoxFit.contain,
          ),
          borderRadius: borderXlAltCircular,
        ),
        child: Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: borderXlAltCircular,
            gradient: const LinearGradient(
              colors: const [transparentColor],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Text(kategori.name, style: boldWhite16),
        ),
      ),
    );
  }
}
