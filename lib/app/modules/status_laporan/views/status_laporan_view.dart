import 'package:flutter/material.dart';
import 'package:newcity/themes/colors.dart';
import 'package:get/get.dart';
import 'package:newcity/widgets/report_tile.dart';
import 'package:newcity/themes/text_theme.dart';
import '../controllers/status_laporan_controller.dart';
import 'package:newcity/themes/radius.dart';
import 'package:newcity/themes/size_box.dart';

class StatusLaporanView extends GetView<StatusLaporanController> {
  const StatusLaporanView({super.key});
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text("Status Laporan", style: boldBlack14),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 30, right: 30),
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
                contentPadding: EdgeInsets.symmetric(vertical: 14),
              ),
            ),
            sBoxh20,
            Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              '/laporan-tersaring',
                              arguments: 'Menunggu',
                            );
                          },
                          child: Container(
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: borderMd,
                              color: Color.fromRGBO(102, 102, 102, 1),
                            ),
                            child: Center(
                              child: const Text('Menunggu', style: boldWhite15),
                            ),
                          ),
                        ),
                      ),
                      sBoxw10,
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              '/laporan-tersaring',
                              arguments: 'Tindak Lanjut',
                            );
                          },
                          child: Container(
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: borderMd,
                              color: backgroundColor,
                            ),
                            child: Center(
                              child: const Text('Tindak Lanjut',
                                  style: boldWhite15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  sBoxh10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              '/laporan-tersaring',
                              arguments: 'Dalam Proses',
                            );
                          },
                          child: Container(
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: borderMd,
                              color: statusDalamProses,
                            ),
                            child: Center(
                              child: const Text('Dalam Proses',
                                  style: boldWhite15),
                            ),
                          ),
                        ),
                      ),
                      sBoxw10,
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              '/laporan-tersaring',
                              arguments: 'Selesai',
                            );
                          },
                          child: Container(
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: borderMd,
                              color: secondaryColor,
                            ),
                            child: Center(
                              child: const Text('Selesai', style: boldWhite15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            sBoxh20,
            const Text('Laporan Terkini', style: boldBlack18),
            sBoxh20,
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
}
