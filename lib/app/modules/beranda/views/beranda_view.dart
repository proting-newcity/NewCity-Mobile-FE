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
            SizedBox(height: 16.0),
            Row(
              children: [
                Image.asset(
                  'assets/images/logo_NewCity_Original.png',
                  width: 40,
                ),
                SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Selamat datang!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: primaryColor)),
                    Text(
                      DateFormat('EEEE dd MMMM yyyy', 'id_ID')
                          .format(DateTime.now()),
                      style: const TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: MotionTabBar(
        controller: controller.motionTabBarController,
        initialSelectedTab: "Beranda",
        labels: const ["Beranda", "Lapor", "Akun"],
        icons: const [Icons.home_outlined, Icons.add, Icons.person_outline],
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 12,
          color: blackColor,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: Colors.black87,
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: primaryColor,
        tabIconSelectedColor: whiteColor,
        tabBarColor: whiteColor,
        onTabItemSelected: (int value) {
          controller.changeTab(value);
        },
      ),
      body: _buildBerandaScreen(),
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
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onSubmitted: (keyword) {
              Get.toNamed('/list-pencarian-laporan', arguments: keyword);
            },
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search, color: primaryColor),
              hintText: 'Cari laporan',
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: primaryColor)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: primaryColor)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: primaryColor)),
              contentPadding: EdgeInsets.symmetric(vertical: 15),
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BuildIconButton(
                  "assets/images/icon_laporan.png", 'Laporan', '/list-laporan'),
              BuildIconButton(
                  "assets/images/icon_berita.png", 'Berita', '/list-berita'),
              BuildIconButton("assets/images/icon_simpan.png", 'Simpan', ''),
              BuildIconButton("assets/images/icon_notifikasi.png", 'Notifikasi',
                  '/notifikasi'),
            ],
          ),
          SizedBox(height: 23.0),
          Text(
            'Rekomendasi Untukmu',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
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
                      return ReportTile(controller.filteredReports[index]);
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
