import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:newcity/widgets/report_tile.dart';
import 'package:newcity/widgets/icon_button.dart';
import '../controllers/beranda_controller.dart';

class BerandaView extends GetView<BerandaController> {
  const BerandaView({super.key});

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
    PersistentTabController _controller = PersistentTabController();

    return PersistentTabView(
      context,
      controller: _controller,
      screens: [
        _buildBerandaScreen(),
        _buildLaporScreen(),
        _buildAkunScreen(),
      ],
      items: _navBarsItems(),
      confineToSafeArea: true,
      backgroundColor: Color(0xFF588157),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,

      // popBehaviorOnSelectedNavBarItemPress: PopActionScreensType.all,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          // screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
          curve: Curves.ease,
        ),
      ),
      navBarStyle: NavBarStyle.style15, // Gunakan gaya style15
    );
  }

  Widget _buildBerandaScreen() {
    final ScrollController _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        controller.fetchReports();
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text('Selamat datang!'),
            Text(
              DateFormat('EEEE dd MMMM yyyy', 'id_ID').format(DateTime.now()),
              style: const TextStyle(fontSize: 12.0),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onSubmitted: (keyword) {
                Get.toNamed('/list-pencarian-laporan', arguments: keyword);
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search, color: Color(0xFF588157)),
                hintText: 'Cari laporan',
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Color(0xFF588157))),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Color(0xFF588157))),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Color(0xFF588157))),
                contentPadding: EdgeInsets.symmetric(vertical: 14),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BuildIconButton("assets/images/icon_laporan.png", 'Laporan',
                    '/list-laporan'),
                BuildIconButton(
                    "assets/images/icon_berita.png", 'Berita', '/list-berita'),
                BuildIconButton("assets/images/icon_simpan.png", 'Simpan', ''),
                BuildIconButton(
                    "assets/images/icon_notifikasi.png", 'Notifikasi', ''),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Rekomendasi Untukmu',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.isTrue) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ListView.builder(
                  controller: _scrollController,
                  itemCount: controller.filteredReports.length + 1,
                  itemBuilder: (context, index) {
                    if (index < controller.filteredReports.length) {
                      return reportTile(controller.filteredReports[index]);
                    } else {
                      return controller.isLoadingMore.isTrue
                          ? const Center(child: CircularProgressIndicator())
                          : const SizedBox.shrink();
                    }
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLaporScreen() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lapor'),
      ),
      body: const Center(child: Text("Lapor Content")),
    );
  }

  Widget _buildAkunScreen() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Akun'),
      ),
      body: const Center(child: Text("Akun Content")),
    );
  }
}
