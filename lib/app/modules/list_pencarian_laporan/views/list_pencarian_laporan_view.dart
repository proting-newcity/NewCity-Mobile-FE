import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_pencarian_laporan_controller.dart';
import 'package:newcity/widgets/report_tile.dart';

class ListPencarianLaporanView extends GetView<ListPencarianLaporanController> {
  const ListPencarianLaporanView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hasil Pencarian',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          if (controller.allReport.value.report.isEmpty) {
            return Center(
              child: Text("Data tidak ditemukan!"),
            );
          }

          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (!controller.isLoading.value &&
                  scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                controller.fetchReportbySearch(Get.arguments.keyword);
              }
              return true;
            },
            child: ListView.builder(
              itemCount: controller.allReport.value.report.length +
                  (controller.hasReachedEnd.value ? 0 : 1),
              itemBuilder: (context, index) {
                if (index < controller.allReport.value.report.length) {
                  return ReportTile(
                    controller.allReport.value.report[index],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          );
        },
      ),
    );
  }
}
