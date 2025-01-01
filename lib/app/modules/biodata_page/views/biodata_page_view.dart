import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../controllers/biodata_page_controller.dart';

class BiodataPageView extends GetView<BiodataPageController> {
  const BiodataPageView({super.key});

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_outlined),
        title: ("Beranda"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.camera_alt_outlined, color: Color(0xFF588157)),
        title: ("Lapor"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
        onPressed: (context) {
          Get.toNamed('/create-laporan', preventDuplicates: false);
        },
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person_outline),
        title: ("Akun"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Akun'),
        backgroundColor: Color(0xFF588157),
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
                color: Color(0xFF588157),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(MediaQuery.of(context).size.width / 1, 110),
                  bottomRight: Radius.elliptical(MediaQuery.of(context).size.width / 1, 110),
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
                SizedBox(height: 16),
                ListTile(
                  title: Text(
                    'Ubah Kata Sandi',
                    style: TextStyle(fontSize: 22),
                  ),
                  onTap: () {
                    // Navigate to change password page
                  },
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Akun',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Get.toNamed('/edit-account');
                  },
                ),
                Divider(),
                ListTile(
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
                  title: Text(
                    'Keluar',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    controller.logout();
                  },
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF588157),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report),
            label: 'Lapor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}
