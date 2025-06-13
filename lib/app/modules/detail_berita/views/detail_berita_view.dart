import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newcity/services/image_service.dart';
import 'package:newcity/themes/colors.dart';
import 'package:newcity/themes/text_theme.dart';
import 'package:newcity/themes/radius.dart';
import '../controllers/detail_berita_controller.dart';
import 'package:newcity/themes/size_box.dart';

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
                  FutureBuilder<ImageProvider<Object>>(
                    future: ImageService.loadImage(Get.arguments.foto),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          height: 225,
                          decoration: BoxDecoration(
                            borderRadius: borderMdCircular,
                            color: greyColor,
                          ),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      } else if (snapshot.hasError) {
                        return Container(
                          height: 225,
                          decoration: BoxDecoration(
                            borderRadius: borderMdCircular,
                            color: greyColor,
                          ),
                          child: Center(
                            child: const Icon(Icons.error, color: redColor),
                          ),
                        );
                      } else {
                        return Container(
                          height: 225,
                          decoration: BoxDecoration(
                            borderRadius: borderMdCircular,
                            image: DecorationImage(
                              image: snapshot.data!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(color: blackColor2),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
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
                              icon: Icon(Icons.arrow_back, color: whiteColor),
                              onPressed: () => Get.back(),
                            ),
                            Expanded(
                              child:
                                  Text(Get.arguments.title, style: boldWhite20),
                            ),
                          ],
                        ),
                        sBoxh8,
                        Padding(
                          padding: const EdgeInsets.only(left: 48.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  DateFormat('EEEE, d MMMM y - kk:mm', 'id_ID')
                                      .format(Get.arguments.tanggal),
                                  style: boldWhite14),
                              sBoxh16,
                              Row(
                                children: [
                                  const Icon(Icons.person, color: whiteColor),
                                  sBoxw4,
                                  Text(Get.arguments.user.name,
                                      style: normalWhite14),
                                ],
                              ),
                              sBoxh16,
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Get.toNamed('/topik-berita',
                                          arguments: Get.arguments.kategori);
                                    },
                                    child: Text(Get.arguments.kategori.name),
                                  ),
                                  const Spacer(),
                                  const Icon(Icons.thumb_up_alt_outlined,
                                      color: whiteColor),
                                  sBoxw16,
                                  const Icon(Icons.bookmark_outline,
                                      color: whiteColor),
                                  sBoxw16,
                                  const Icon(Icons.share_outlined,
                                      color: whiteColor),
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
                    sBoxh16,
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
