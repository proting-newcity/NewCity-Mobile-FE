import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:newcity/app/modules/beranda/views/beranda_view.dart';
import 'package:newcity/app/modules/biodata_page/views/biodata_page_view.dart';
import 'package:newcity/app/modules/create_laporan/views/create_laporan_view.dart';
import 'package:newcity/themes/colors.dart';
import 'package:newcity/themes/text_theme.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    // List of your pages
    final List<Widget> pages = [
      const BerandaView(),
      CreateLaporanView(),
      const BiodataPageView(),
    ];

    return Scaffold(
      bottomNavigationBar: MotionTabBar(
        controller: controller.motionTabBarController,
        labels: const ["Beranda", "Lapor", "Akun"],
        icons: const [Icons.home_outlined, Icons.add, Icons.person_outline],
        initialSelectedTab: "Beranda",
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: boldBlack14,
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
      // The body will change based on the selected tab index
      body: Obx(() => pages[controller.tabIndex.value]),
    );
  }
}
