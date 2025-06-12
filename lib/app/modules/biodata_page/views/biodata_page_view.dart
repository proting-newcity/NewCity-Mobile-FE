import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newcity/services/image_service.dart';
import '../controllers/biodata_page_controller.dart';
import 'package:newcity/themes/colors.dart';
import 'package:newcity/themes/text_theme.dart';
import 'package:newcity/themes/size_box.dart';

class BiodataPageView extends GetView<BiodataPageController> {
  const BiodataPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Akun', style: normalWhite22),
        backgroundColor: primaryColor,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 110,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(
                      MediaQuery.of(context).size.width / 0.5, 100),
                  bottomRight: Radius.elliptical(
                      MediaQuery.of(context).size.width / 0.5, 100),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                sBoxh5,
                Obx(() {
                  if (controller.user.value == null) {
                    return CircleAvatar(
                      radius: 88,
                      backgroundColor: Colors.grey[200],
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                      ),
                    );
                  } else {
                    return FutureBuilder<ImageProvider>(
                      future: ImageService.loadImage(
                          controller.user.value!.foto ?? ''),
                      builder: (ctx, snap) {
                        if (snap.connectionState == ConnectionState.waiting) {
                          return CircleAvatar(
                            radius: 88,
                            backgroundColor: Colors.grey[200],
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(primaryColor),
                            ),
                          );
                        }
                        if (snap.hasError || snap.data == null) {
                          return CircleAvatar(
                            radius: 88,
                            backgroundImage:
                                AssetImage('assets/placeholder.png'),
                          );
                        }
                        return CircleAvatar(
                          radius: 88,
                          backgroundImage: snap.data,
                        );
                      },
                    );
                  }
                }),
                sBoxh16,
                Obx(() {
                  return Text('${controller.user.value?.name}',
                      style: boldTextLight14);
                }),
                sBoxh8,
                Obx(() {
                  return Text(
                    '${controller.user.value?.username}',
                    style: normalBlack18,
                    textAlign: TextAlign.center,
                  );
                }),
                sBoxh23,
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.5,
                        blurRadius: 8,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/edit-akun',
                              arguments: controller.user.value);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.account_circle),
                                sBoxw8,
                                Text(
                                  'Edit Akun',
                                  style: normalBlack14,
                                ),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios, size: 16)
                          ],
                        ),
                      ),
                      sBoxh23,
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/faq');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.question_mark),
                                sBoxw8,
                                Text(
                                  'Bantuan',
                                  style: normalBlack14,
                                ),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios, size: 16)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                sBoxh30,
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.5,
                        blurRadius: 8,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      _showLogoutDialog(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.exit_to_app, color: redColor),
                            sBoxw8,
                            const Text('Keluar', style: normalRed14),
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios, size: 16)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Konfirmasi Keluar"),
          content: const Text("Apakah Anda yakin ingin keluar?"),
          actions: [
            TextButton(
              child: const Text("Batal"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Lanjut"),
              onPressed: () {
                Navigator.of(context).pop();
                Get.toNamed('/login');
              },
            ),
          ],
        );
      },
    );
  }
}
