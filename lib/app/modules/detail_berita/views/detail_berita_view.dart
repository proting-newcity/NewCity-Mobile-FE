import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newcity/api.dart';

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
                  Container(
                    height: 225,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: ApiService.loadImage(Get.arguments.foto),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        // The dark overlay
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(
                                0.4), // Adjust opacity to control darkness
                          ),
                        ),
                      ],
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
                                Get.arguments.title,
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
                                  Text(Get.arguments.user.name,
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
                                    child: Text(Get.arguments.kategori.name),
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    // Placeholder text konten berita
                    Text(
                      Get.arguments.content,
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
