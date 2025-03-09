import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import '../controllers/biodata_page_controller.dart';

class BiodataPageView extends GetView<BiodataPageController> {
  const BiodataPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final String userId = "2";
    controller.setUserId(userId);
    // controller.fetchUserData();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Get.toNamed('/beranda');
          },
        ),
        title:
            Text('Akun', style: TextStyle(fontSize: 22, color: Colors.white)),
        backgroundColor: Color(0xFF588157),
      ),
      body: Obx(() {
        controller.updateFlag.value;
        return Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 110,
                decoration: BoxDecoration(
                  color: Color(0xFF588157),
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
                  CircleAvatar(
                    radius: 88,
                    child: Icon(Icons.person, size: 50),
                  ),
                  SizedBox(height: 16),
                  Obx(() {
                    return Text(
                      controller.userName.value,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }),
                  SizedBox(height: 8),
                  Obx(() {
                    return Text(
                      '${controller.userEmail.value} | ${controller.userPhone.value}',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    );
                  }),
                  SizedBox(height: 55),
                  ListTile(
                    leading: Icon(Icons.lock),
                    title: Text(
                      'Ubah Kata Sandi',
                      style: TextStyle(fontSize: 20),
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
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      Get.toNamed('/edit-akun');
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.question_mark),
                    title: Text(
                      'Bantuan',
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      // Navigate to help page
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.exit_to_app, color: Colors.red),
                    title: Text(
                      'Keluar',
                      style: TextStyle(fontSize: 20, color: Colors.red),
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
        );
      }),
      bottomNavigationBar: MotionTabBar(
        controller: controller.motionTabBarController,
        initialSelectedTab: "Akun",
        labels: const ["Beranda", "Lapor", "Akun"],
        icons: const [Icons.home_outlined, Icons.add, Icons.person_outline],
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: Colors.black87,
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: Color(0xFF588157),
        tabIconSelectedColor: Colors.white,
        tabBarColor: Colors.white,
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
