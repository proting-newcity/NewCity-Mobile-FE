import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/list_berita_controller.dart';
import 'package:newcity/model.dart';

class ListBeritaView extends GetView<ListBeritaController> {
  const ListBeritaView({super.key});
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
              () => controller.allBerita.value.berita != null
                  ? ListView(
                      children: [
                        for (var index = 0;
                            index < controller.allBerita.value.berita!.length;
                            index++)
                          _beritaTile(
                            controller.allBerita.value.berita![index],
                            index,
                          ),
                      ],
                    )
                  : Wrap(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _appBarTopik() {
    return Obx(() {
      var kategoriList = controller.allBerita.value.kategoriList;
      return SizedBox(
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kategoriList!.length,
          itemBuilder: (context, index) {
            return _topikTile(kategoriList[index]);
          },
        ),
      );
    });
  }

  Widget _topikTile(Kategori kategori) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/topik-berita', arguments: kategori);
      },
      child: Container(
        width: 150,
        margin: EdgeInsets.symmetric(horizontal: 8),
        // placeholder gambar
        decoration: BoxDecoration(
          color: Colors.red,
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
          // judul topik
          child: Text(
            kategori.judul,
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
              // placeholder gambar
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
                      DateFormat('yyyy-MM-dd – kk:mm')
                          .format(beritaData.tanggal),
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
}
