import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newcity/widgets/report_tile_government.dart';

import '../controllers/status_laporan_controller.dart';

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
        title: Text(
          "Status Laporan",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
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
            SizedBox(height: 20),
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
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Color.fromRGBO(102, 102, 102, 1),
                            ),
                            child: Center(
                              child: Text(
                                'Menunggu',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
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
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Color.fromRGBO(171, 192, 171, 1),
                            ),
                            child: Center(
                              child: Text(
                                'Tindak Lanjut',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
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
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Color.fromRGBO(250, 178, 45, 1),
                            ),
                            child: Center(
                              child: Text(
                                'Dalam Proses',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
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
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Color.fromRGBO(58, 90, 64, 1),
                            ),
                            child: Center(
                              child: Text(
                                'Selesai',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Laporan Terkini',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 20),
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
                      return ReportTileGovernment(
                          controller.filteredReports[index]);
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
