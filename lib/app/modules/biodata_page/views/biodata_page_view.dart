import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../controllers/biodata_page_controller.dart';
import 'dart:io';

class BiodataPageView extends GetView<BiodataPageController> {
  const BiodataPageView({super.key});

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_outlined),
        title: ("Beranda"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
        onPressed: (context) {
          Get.toNamed('/beranda', preventDuplicates: false);
        },
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
        onPressed: (context) {
          Get.toNamed('/biodata-page', preventDuplicates: false);
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller = PersistentTabController();

    return PersistentTabView(
      context,
      controller: _controller,
      screens: [
        _buildBiodataScreen(context),
        _buildLaporScreen(context),
        _buildAkunScreen(context),
      ],
      items: _navBarsItems(),
      confineToSafeArea: true,
      backgroundColor: Color(0xFF588157),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
      ),
      navBarStyle: NavBarStyle.style15,
    );
  }

  Widget _buildBiodataScreen(BuildContext context) {
    controller.fetchUserData();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Get.back();
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
                   Obx(() {
                    return CircleAvatar(
                      radius: 88,
                      backgroundImage: controller.profileImagePath.value.isEmpty
                          ? AssetImage('assets/default_profile.png')
                          : FileImage(File(controller.profileImagePath.value)) as ImageProvider,
                      child: controller.profileImagePath.value.isEmpty
                          ? Icon(Icons.person, size: 50)
                          : null,
                    );
                  }),
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

  Widget _buildLaporScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lapor'),
      ),
      body: const Center(child: Text("Lapor Content")),
    );
  }

  Widget _buildAkunScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Akun'),
      ),
      body: const Center(child: Text("Akun Content")),
    );
  }
}
