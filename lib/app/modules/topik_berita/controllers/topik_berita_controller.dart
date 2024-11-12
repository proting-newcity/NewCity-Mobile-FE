import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:newcity/model.dart';

class TopikBeritaController extends GetxController {
  Rx<AllBerita> allBerita = AllBerita().obs;
  @override
  void onInit() {
    readJson();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void readJson() async {
    try {
      var feedLoadedData = await rootBundle.loadString("assets/berita.json");
      allBerita.value = AllBerita.fromJson(jsonDecode(feedLoadedData));
    } catch (e) {
      Get.snackbar("Server Error", "error in getting berita data");
      print("feed value error" + e.toString());
    }
  }

  // filter buat nampilin list berita berdasarkan judul kategori
  List<Berita> getBeritaByKategori(String judulKategori) {
    return allBerita.value.berita?.where((berita) {
          return berita.kategori.judul.toLowerCase() ==
              judulKategori.toLowerCase();
        }).toList() ??
        [];
  }
}
