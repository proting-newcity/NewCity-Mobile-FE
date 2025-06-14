import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newcity/widgets/topic_chip.dart';
import '../controllers/list_laporan_controller.dart';
import 'package:newcity/widgets/report_tile.dart';
import 'package:newcity/themes/colors.dart';
import 'package:newcity/themes/text_theme.dart';
import 'package:newcity/themes/size_box.dart';

class ListLaporanView extends GetView<ListLaporanController> {
  const ListLaporanView({super.key});

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
        title: const Text('Laporan', style: boldBlack22),
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
            Obx(() {
              return Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: List<Widget>.generate(
                    controller.allKategori.value.kategori.length, (int index) {
                  return TopicChip(
                      controller.allKategori.value.kategori[index].name,
                      index,
                      controller.selectedTopics);
                }),
              );
            }),
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
