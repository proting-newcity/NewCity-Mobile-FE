import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/list_laporan_controller.dart';
import 'package:newcity/widgets/report_tile.dart';

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
        title: const Text('Laporan'),
        centerTitle: true,
      ),
      body: Obx(() {
        // Show loading indicator while fetching data
        if (controller.isLoading.isTrue) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          controller: _scrollController,
          itemCount: controller.filteredReports.length + 1,
          itemBuilder: (context, index) {
            if (index < controller.filteredReports.length) {
              return reportTile(controller.filteredReports[index]);
            } else {
              return controller.isLoadingMore.isTrue
                  ? const Center(child: CircularProgressIndicator())
                  : const SizedBox.shrink();
            }
          },
        );
      }),
    );
  }
}
