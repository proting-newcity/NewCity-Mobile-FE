import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newcity/widgets/report_tile_government.dart';

import '../controllers/government_controller.dart';

class GovernmentView extends GetView<GovernmentController> {
  const GovernmentView({super.key});
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
      body: Container(
        margin: EdgeInsets.only(left: 30, top: 55, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 13),
                  child: Image.asset(
                    "assets/images/logo_NewCity_Original.png",
                    height: 50,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selamat datang!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(58, 90, 64, 1),
                          fontFamily: 'Poppins',
                          fontSize: 26,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      DateFormat('EEEE dd MMMM yyyy', 'id_ID')
                          .format(DateTime.now()),
                      style: TextStyle(
                          color: Color.fromRGBO(129, 125, 125, 1),
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 20),
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
              child: SizedBox(
                width: 280,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          '/status-laporan',
                        );
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 32,
                            backgroundColor: Color.fromRGBO(88, 129, 87, 1),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Status',
                            style: TextStyle(
                              color: Color.fromRGBO(88, 129, 87, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          '/biodata-page',
                        );
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 32,
                            backgroundColor: Color.fromRGBO(88, 129, 87, 1),
                            child: Icon(
                              Icons.person_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Profil',
                            style: TextStyle(
                              color: Color.fromRGBO(88, 129, 87, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Rekomendasi Untukmu',
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
