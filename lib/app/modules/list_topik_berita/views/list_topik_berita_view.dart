import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newcity/api.dart';
import 'package:newcity/theme/colors.dart';
import '../controllers/list_topik_berita_controller.dart';
import 'package:newcity/models/berita.dart';

class ListTopikBeritaView extends GetView<ListTopikBeritaController> {
  const ListTopikBeritaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Topik Berita",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(() => ListView.builder(
            itemCount: controller.allKategori.value.kategori.length,
            itemBuilder: (context, index) {
              final kategori = controller.allKategori.value.kategori[index];
              return TopikTile(kategori: kategori);
            },
          )),
    );
  }
}

Widget TopikTile({required KategoriBerita kategori}) {
  return GestureDetector(
    onTap: () {
      Get.toNamed('/topik-berita', arguments: kategori);
    },
    child: Container(
      height: 150,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: FutureBuilder<ImageProvider<Object>>(
        future: ApiService.loadImage(kategori.foto),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Container(
              color: greyColor,
              child: Center(
                child: Icon(Icons.error, color: redColor),
              ),
            );
          } else {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: snapshot.data!,
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [
                      blackColor.withOpacity(0.6),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Text(
                  kategori.name,
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }
        },
      ),
    ),
  );
}
