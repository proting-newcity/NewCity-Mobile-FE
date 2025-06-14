import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newcity/themes/radius.dart';
import 'package:newcity/widgets/report_tile.dart';
import 'package:newcity/widgets/icon_button.dart';
import '../controllers/beranda_controller.dart';
import 'package:newcity/themes/colors.dart';
import 'package:newcity/themes/text_theme.dart';
import 'package:newcity/themes/size_box.dart';

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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: kToolbarHeight + 20,
        title: Column(
          children: [
            sBoxh16,
            Row(
              children: [
                sBoxw10,
                Image.asset(
                  'assets/images/logo_NewCity_Original.png',
                  width: 40,
                ),
                sBoxw10,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Selamat datang!', style: boldPrimaryColor14),
                    Text(
                        DateFormat('EEEE dd MMMM yyyy', 'id_ID')
                            .format(DateTime.now()),
                        style: normalgrey12)
                  ],
                ),
              ],
            ),
          ],
        ),
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
                  borderRadius: borderXxxl,
                  borderSide: BorderSide(color: primaryColor, width: 2)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: borderXxxl,
                  borderSide: BorderSide(color: primaryColor, width: 1)),
              border: OutlineInputBorder(
                  borderRadius: borderXxxl,
                  borderSide: BorderSide(color: primaryColor, width: 2)),
              contentPadding: EdgeInsets.symmetric(vertical: 15),
            ),
          ),
          sBoxh16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BuildIconButton(
                  "assets/images/icon_laporan.png", 'Laporan', '/list-laporan'),
              BuildIconButton(
                  "assets/images/icon_berita.png", 'Berita', '/list-berita'),
              BuildIconButton(
                  "assets/images/icon_simpan.png", 'Simpan', '/simpan-laporan'),
              BuildIconButton("assets/images/icon_notifikasi.png", 'Notifikasi',
                  '/notifikasi'),
            ],
          ),
          sBoxh23,
          Text(
            'Rekomendasi Untukmu',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          sBoxh20,
          Expanded(
            child: Obx(() {
              if (controller.isLoading.isTrue) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                controller: _scrollController,
                itemCount: controller.reports.length + 1,
                itemBuilder: (context, index) {
                  if (index < controller.reports.length) {
                    return ReportTile(controller.reports[index]);
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
