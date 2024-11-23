import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GovermentController extends GetxController {
  //TODO: Implement GovermentController
  static final List<Map<String, dynamic>> listMap = [
    {
      'title': 'Banjir Bandang di Kawasan Braga, 150 Orang Dievakuasi!',
      'date': 'Senin, 14 Okt 2024 13:00 WIB',
      'description':
          'Lorem ipsum odor amet, consectetuer adipiscing elit. Egestas natoque malesuada ut lectus per libero odio ut erat. Conubia rutrum semper dui aliquet eu efficitur venenatis aliquam dapibus. Aliquam elit turpis augue; maecenas sem nunc condimentum. Aptent cubilia natoque nascetur vivamus ridiculus. Viverra himenaeos vestibulum ac suspendisse dictum quis dapibus. Ante tellus vitae duis rutrum venenatis non venenatis ex. Gravida aenean non facilisi quam montes non tortor. Commodo litora habitasse erat porttitor est. Molestie urna sagittis varius odio rhoncus efficitur felis a urna. Praesent accumsan porttitor aliquet fames; ',
      'author': 'Fiona',
      'location': 'Braga, Kota Bandung, Jawa barat',
      'imagePath': 'assets/images/banjir_braga.png',
      'status': 'Tindak Lanjut',
      'color': Color.fromRGBO(171, 192, 171, 1),
    },
    {
      'title': 'Hati-hati!, Banyak Lubang di Jalan Sumbawa Bandung!',
      'date': 'Rabu, 16 Oktober 2024, 15.00 WIB',
      'description':
          'Lorem ipsum odor amet, consectetuer adipiscing elit. Egestas natoque malesuada ut lectus per libero odio ut erat. Conubia rutrum semper dui aliquet eu efficitur venenatis aliquam dapibus. Aliquam elit turpis augue; maecenas sem nunc condimentum. Aptent cubilia natoque nascetur vivamus ridiculus. Viverra himenaeos vestibulum ac suspendisse dictum quis dapibus. Ante tellus vitae duis rutrum venenatis non venenatis ex. Gravida aenean non facilisi quam montes non tortor. Commodo litora habitasse erat porttitor est. Molestie urna sagittis varius odio rhoncus efficitur felis a urna. Praesent accumsan porttitor aliquet fames; ',
      'author': 'Nadhil',
      'location': 'Cipagalo, Kec. Bojongsoang, Kabupaten Bandung, Jawa Barat',
      'imagePath': 'assets/images/jalan_berlubang.png',
      'status': 'Selesai',
      'color': Color.fromRGBO(58, 90, 64, 1),
    },
    {
      'title':
          'Bukannya Berkurang, Sampah dari Kota Bandung ke Sarimukti Justru Melonjak!',
      'date': 'Selasa, 15 Oktober 2024',
      'description':
          'Lorem ipsum odor amet, consectetuer adipiscing elit. Egestas natoque malesuada ut lectus per libero odio ut erat. Conubia rutrum semper dui aliquet eu efficitur venenatis aliquam dapibus. Aliquam elit turpis augue; maecenas sem nunc condimentum. Aptent cubilia natoque nascetur vivamus ridiculus. Viverra himenaeos vestibulum ac suspendisse dictum quis dapibus. Ante tellus vitae duis rutrum venenatis non venenatis ex. Gravida aenean non facilisi quam montes non tortor. Commodo litora habitasse erat porttitor est. Molestie urna sagittis varius odio rhoncus efficitur felis a urna. Praesent accumsan porttitor aliquet fames; ',
      'author': 'Dhilla',
      'location': 'Kota Bandung, Jawa Barat',
      'imagePath': 'assets/images/sampah.png',
      'status': 'Dalam Proses',
      'color': Color.fromRGBO(250, 178, 45, 1),
    },
    {
      'title': 'Gedebage hingga Kopo Rawan Banjir di Kota Bandung',
      'date': 'Rabu, 16 Oktober 2024',
      'description':
          'Lorem ipsum odor amet, consectetuer adipiscing elit. Egestas natoque malesuada ut lectus per libero odio ut erat. Conubia rutrum semper dui aliquet eu efficitur venenatis aliquam dapibus. Aliquam elit turpis augue; maecenas sem nunc condimentum. Aptent cubilia natoque nascetur vivamus ridiculus. Viverra himenaeos vestibulum ac suspendisse dictum quis dapibus. Ante tellus vitae duis rutrum venenatis non venenatis ex. Gravida aenean non facilisi quam montes non tortor. Commodo litora habitasse erat porttitor est. Molestie urna sagittis varius odio rhoncus efficitur felis a urna. Praesent accumsan porttitor aliquet fames; ',
      // 'author': '',
      'location': 'Kota Bandung, Jawa Barat',
      'imagePath': 'assets/images/banjir_gedebage.png',
      'status': 'Menunggu',
      'color': Color.fromRGBO(102, 102, 102, 1),
    },
  ];

  final count = 0.obs;
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

  void increment() => count.value++;
}
