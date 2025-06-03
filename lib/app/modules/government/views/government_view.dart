import 'package:flutter/material.dart';
import 'package:newcity/theme/colors.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newcity/widgets/report_tile.dart';
import 'package:newcity/theme/text_theme.dart';
import '../controllers/government_controller.dart';
import 'package:newcity/theme/Radius.dart';

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
                    const Text('Selamat datang!',
                        textAlign: TextAlign.center,
                        style: boldSecondaryColor26),
                    Text(
                        DateFormat('EEEE dd MMMM yyyy', 'id_ID')
                            .format(DateTime.now()),
                        style: boldBlack14Light14),
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
                prefixIcon: Icon(Icons.search, color: primaryColor),
                hintText: 'Cari laporan',
                focusedBorder: OutlineInputBorder(
                    borderRadius: borderXxxl,
                    borderSide: BorderSide(color: primaryColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: borderXxxl,
                    borderSide: BorderSide(color: primaryColor)),
                border: OutlineInputBorder(
                    borderRadius: borderXxxl,
                    borderSide: BorderSide(color: primaryColor)),
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
                            backgroundColor: backgroundColor,
                            child: Icon(
                              Icons.check,
                              color: whiteColor,
                            ),
                          ),
                          const Text('Status', style: regularBackgroundColor14),
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
                            backgroundColor: backgroundColor,
                            child: Icon(
                              Icons.person_outlined,
                              color: whiteColor,
                            ),
                          ),
                          const Text('Profil', style: regularBackgroundColor14),
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
              style: boldBlack18,
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
