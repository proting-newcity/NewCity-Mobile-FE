import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newcity/themes/colors.dart';
import 'package:newcity/themes/text_theme.dart';
import 'package:newcity/widgets/report_tile.dart';

import '../controllers/simpan_laporan_controller.dart';

class SimpanLaporanView extends GetView<SimpanLaporanController> {
  const SimpanLaporanView({super.key});
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
        backgroundColor: whiteColor,
        elevation: 0,
        title: const Text('Simpan Laporan', style: boldBlack22),
        centerTitle: false,
        actions: [
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: const Text('Laporan Saya', style: boldPrimaryColor14),
              ),
            ),
            onTap: () {
              Get.toNamed('/laporan-saya');
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () => Get.back(),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(
          Icons.add,
          color: whiteColor,
        ),
        label: const Text("Tambah Laporan", style: normalWhite14),
        backgroundColor: primaryColor,
        onPressed: () {
          Get.toNamed('/create-laporan');
        },
      ),
    );
  }
}
