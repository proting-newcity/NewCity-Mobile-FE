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
            padding: const EdgeInsets.all(16.0),
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
                sBoxh55,
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: const Text(
                    'Edit Akun',
                    style: normalBlack18,
                  ),
                  onTap: () {
                    Get.toNamed('/edit-akun', arguments: controller.user.value);
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.question_mark),
                  title: const Text(
                    'Bantuan',
                    style: normalBlack18,
                  ),
                  onTap: () {
                    Get.toNamed('/faq');
                  },
                ),
                Divider(),
                ListTile(
                  leading: const Icon(Icons.exit_to_app, color: redColor),
                  title: const Text('Keluar', style: normalRed20),
                  onTap: () {
                    _showLogoutDialog(context);
                  },
                ),
                sBoxh16,
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
