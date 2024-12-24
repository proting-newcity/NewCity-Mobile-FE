import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newcity/api.dart';
import 'package:newcity/widgets/comments.dart';

import '../controllers/detail_laporan_controller.dart';

class DetailLaporanView extends GetView<DetailLaporanController> {
  DetailLaporanView({super.key});

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
                  Obx(() {
                    if (controller.report.value == null) {
                      return Container(
                        height: 225,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[300],
                        ),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else {
                      return FutureBuilder<ImageProvider<Object>>(
                        future: ApiService.loadImage(
                            controller.report.value!.report.foto),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container(
                              height: 225,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey[300],
                              ),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          } else if (snapshot.hasError) {
                            return Container(
                              height: 225,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey[300],
                              ),
                              child: Center(
                                child: Icon(Icons.error, color: Colors.red),
                              ),
                            );
                          } else if (!snapshot.hasData) {
                            return Container(
                              height: 225,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey[300],
                              ),
                              child: Center(
                                child: Icon(Icons.image, color: Colors.grey),
                              ),
                            );
                          } else {
                            return Container(
                              height: 225,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: snapshot.data!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.4),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      );
                    }
                  }),
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
                              child: Obx(() {
                                return Text(
                                  controller.report.value?.report.judul ??
                                      'Loading...',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.only(left: 48.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(() {
                                return Text(
                                  controller.report.value != null
                                      ? DateFormat('yyyy-MM-dd – kk:mm').format(
                                          controller
                                              .report.value!.report.updatedAt)
                                      : 'Loading...',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                );
                              }),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  const Icon(Icons.person, color: Colors.white),
                                  const SizedBox(width: 4),
                                  Obx(() {
                                    return Text(
                                      controller.report.value?.masyarakatName ??
                                          'Loading...',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    );
                                  }),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Obx(() {
                                      return Text(
                                        controller.report.value?.report
                                                .status[0] ??
                                            'Loading...',
                                      );
                                    }),
                                    style: ElevatedButton.styleFrom(),
                                  ),
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
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kategori',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Obx(() {
                      return Text(
                        controller.report.value != null
                            ? controller.report.value!.kategoriName
                            : 'Loading...',
                      );
                    }),
                    SizedBox(height: 16),
                    Text(
                      'Lokasi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Obx(() {
                      return Text(
                        controller.report.value != null
                            ? controller.report.value!.report.lokasi
                            : 'Loading...',
                      );
                    }),
                    SizedBox(height: 16),
                    Text(
                      'Detail Laporan',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Obx(() {
                      return Text(
                        controller.report.value?.report.deskripsi ??
                            'Loading...',
                        textAlign: TextAlign.justify,
                      );
                    }),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            controller.isLiked.value
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: controller.isLiked.value
                                ? Colors.red
                                : Colors.grey,
                          ),
                          onPressed: () {
                            controller.toggleLike();
                            (context as Element).markNeedsBuild();
                            print(controller.isLiked.value);
                          },
                        ),
                        Text(controller.likes.value.toString()),
                        SizedBox(width: 16),
                        IconButton(
                          icon: Icon(Icons.comment, color: Colors.grey),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Comment(context);
                              },
                            );
                          },
                        ),
                        Text("3"),
                        SizedBox(width: 16),
                        IconButton(
                          icon: Icon(Icons.share, color: Colors.grey),
                          onPressed: () {},
                        ),
                        Text("10"),
                        Spacer(),
                        IconButton(
                          icon: Icon(
                            controller.isBookmarked.value
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            color: controller.isBookmarked.value
                                ? Colors.blue
                                : Colors.grey,
                          ),
                          onPressed: () {
                            controller.toggleBookmark();
                            (context as Element).markNeedsBuild();
                          },
                        ),
                      ],
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
