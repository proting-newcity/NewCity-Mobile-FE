import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/detail_berita_controller.dart';

class DetailBeritaView extends GetView<DetailBeritaController> {
  const DetailBeritaView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  // placeholder gambar
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3),
                      BlendMode.colorBurn,
                    ),
                    child: Container(
                      height: 225,
                      decoration: BoxDecoration(color: Colors.red),
                    ),
                  ),
                  // Konten teks di atas gambar
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 16,
                    top: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back, color: Colors.white),
                              onPressed: () => Get.back(),
                            ),
                            Expanded(
                              child: Text(
                                Get.arguments.judul,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.only(
                              left:
                                  48.0), // Padding untuk menyamakan dengan posisi judul
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                DateFormat('yyyy-MM-dd – kk:mm')
                                    .format(Get.arguments.tanggal),
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  const Icon(Icons.person, color: Colors.white),
                                  const SizedBox(width: 4),
                                  Text(Get.arguments.editor,
                                      style:
                                          const TextStyle(color: Colors.white)),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Get.toNamed('/topik-berita',
                                          arguments: Get.arguments.kategori);
                                    },
                                    child: Text(Get.arguments.kategori.judul),
                                    style: ElevatedButton.styleFrom(),
                                  ),
                                  const Spacer(),
                                  const Icon(Icons.thumb_up_alt_outlined,
                                      color: Colors.white),
                                  const SizedBox(width: 16),
                                  const Icon(Icons.bookmark_outline,
                                      color: Colors.white),
                                  const SizedBox(width: 16),
                                  const Icon(Icons.share_outlined,
                                      color: Colors.white),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    // Placeholder text konten berita
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      textAlign: TextAlign.justify,
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
