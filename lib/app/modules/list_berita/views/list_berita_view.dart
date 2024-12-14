import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newcity/widgets/berita_tile.dart';
import 'package:newcity/api.dart';
import '../controllers/list_berita_controller.dart';
import 'package:newcity/models/berita.dart';

class ListBeritaView extends GetView<ListBeritaController> {
  const ListBeritaView({super.key});
  Future<List<ImageProvider<Object>>> loadCategoryImages(
      List<KategoriBerita> kategoriList) async {
    List<Future<ImageProvider<Object>>> futures = [];

    for (var kategori in kategoriList) {
      futures.add(ApiService.loadImage(kategori.foto));
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
        title: Text(
          "Berita",
          style: TextStyle(fontWeight: FontWeight.bold),
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
                Text(
                  "Topik Terkenal",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Get.toNamed("/list-topik-berita");
                    },
                    child: Text(
                      "Topik lainnya",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ))
              ],
            ),
          ),
          _appBarTopik(),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "Berita Untukmu",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => controller.allBerita.value.berita.isNotEmpty
                  ? ListView.builder(
                      itemCount: controller.allBerita.value.berita.length,
                      itemBuilder: (context, index) {
                        return BeritaTile(
                          controller.allBerita.value.berita[index],
                          index,
                        );
                      },
                    )
                  : Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _appBarTopik() {
    return Obx(() {
      var kategoriList = controller.allKategori.value.kategori;
      if (kategoriList.isEmpty) {
        return Center(child: CircularProgressIndicator());
      }
      return FutureBuilder<List<ImageProvider<Object>>>(
        future: loadCategoryImages(kategoriList),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error loading images"));
          } else if (!snapshot.hasData) {
            return Center(child: Text("No data available"));
          } else {
            List<ImageProvider<Object>> categoryImages = snapshot.data ?? [];

            return SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: kategoriList.length,
                itemBuilder: (context, index) {
                  return _topikTile(kategoriList[index], categoryImages[index]);
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
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.6),
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Text(
            kategori.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
