import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:newcity/widgets/report_tile.dart';
import 'package:newcity/widgets/icon_button.dart';
import '../controllers/beranda_controller.dart';

class BerandaView extends GetView<BerandaController> {
  const BerandaView({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        controller.fetchReports();
      }
    });
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Column(
              children: [
                const Text('Selamat datang!'),
                Text(
                  DateFormat('EEEE dd MMMM yyyy', 'id_ID')
                      .format(DateTime.now()),
                  style: const TextStyle(fontSize: 12.0),
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
          body: _buildBerandaScreen(),
        ));
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
              BuildIconButton(
                  "assets/images/icon_laporan.png", 'Laporan', '/list-laporan'),
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
    );
  }
}
