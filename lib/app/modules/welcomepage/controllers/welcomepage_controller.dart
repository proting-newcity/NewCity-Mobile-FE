import 'package:get/get.dart';

class WelcomepageController extends GetxController {
  static final List<Map> list = [
    {
      "image": "assets/images/img_welcomepage1.png",
      "title": "Selamat Datang!\n",
      "description":
          "Bersama NewCity, jadilah bagian dari\nkomunitas yang aktif dan saling terhubung!",
    },
    {
      "image": "assets/images/img_welcomepage2.png",
      "title": "Setiap laporan\nAnda berharga!",
      "description":
          "Semakin banyak Anda melapor, semakin cepat kita menyelesaikan masalah.",
    },
    {
      "image": "assets/images/img_welcomepage3.png",
      "title": "Informasi Real-Time\nyang terjangkau",
      "description":
          "NewCity menyediakan akses cepat dan mudah dijangkau terhadap data dan berita terbaru.",
    }
  ];

  // Menggunakan Rx untuk merespon perubahan pada UI
  var currentIndex = 0.obs;

  void nextContent() {
    // Increment indeks jika belum mencapai akhir list, atau kembali ke awal
    currentIndex.value = (currentIndex.value + 1) % list.length;
  }

  @override
  void onInit() {
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
}
