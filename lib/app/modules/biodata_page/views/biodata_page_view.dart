import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:newcity/models/user.dart";
import 'package:motion_tab_bar/MotionTabBar.dart';
import '../controllers/biodata_page_controller.dart';
import 'package:newcity/theme/colors.dart';
import 'package:newcity/theme/text_theme.dart';

// ignore: must_be_immutable
class BiodataPageView extends GetView<BiodataPageController> {
  // const BiodataPageView({super.key});
  var user = Rx<User?>(null);

  final BiodataPageController biodataController =
      Get.find<BiodataPageController>();

  BiodataPageView({super.key});

  @override
  Widget build(BuildContext context) {
    // controller.fetchUserData();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: whiteColor,
          onPressed: () {
            Get.toNamed('/beranda');
          },
        ),
        title: Text('Akun', style: TextStyle(fontSize: 22, color: whiteColor)),
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
                SizedBox(height: 5),
                //TODO update biar load gambar dari API (malas)
                CircleAvatar(
                  radius: 88,
                  child: Icon(Icons.person, size: 50),
                ),
                SizedBox(height: 16),
                Obx(() {
                  return Text('${controller.user.value?.name}', style: h2);
                }),
                SizedBox(height: 8),
                Obx(() {
                  return Text(
                    '${controller.user.value?.username}',
                    style: sizeL,
                    textAlign: TextAlign.center,
                  );
                }),
                SizedBox(height: 55),
                ListTile(
                  leading: Icon(Icons.lock),
                  title: Text(
                    'Ubah Kata Sandi',
                    style: sizeXL,
                  ),
                  onTap: () {
                    Get.toNamed('/lupa-password');
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text(
                    'Edit Akun',
                    style: sizeXL,
                  ),
                  onTap: () {
                    Get.toNamed('/edit-akun', arguments: controller.user.value);
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.question_mark),
                  title: Text(
                    'Bantuan',
                    style: sizeXL,
                  ),
                  onTap: () {
                    // Navigate to help page
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.exit_to_app, color: redColor),
                  title: Text(
                    'Keluar',
                    style: TextStyle(fontSize: 20, color: redColor),
                  ),
                  onTap: () {
                    _showLogoutDialog(context);
                  },
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: MotionTabBar(
        //controller: controller.motionTabBarController,
        initialSelectedTab: "Akun",
        labels: const ["Beranda", "Lapor", "Akun"],
        icons: const [Icons.home_outlined, Icons.add, Icons.person_outline],
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: h4.copyWith(
          color: blackColor,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: blackColor,
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: primaryColor,
        tabIconSelectedColor: whiteColor,
        tabBarColor: whiteColor,
        onTabItemSelected: (int value) {
          controller.changeTab(value);
        },
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Konfirmasi Keluar"),
          content: Text("Apakah Anda yakin ingin keluar?"),
          actions: [
            TextButton(
              child: Text("Batal"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Lanjut"),
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
