import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newcity/models/user.dart';
import 'package:newcity/widgets/notifikasi_tile.dart';

import '../controllers/notifikasi_controller.dart';

class NotifikasiView extends GetView<NotifikasiController> {
  const NotifikasiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Notifikasi",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              "Laporan Saya",
              style: TextStyle(
                color: Colors.green[700],
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Obx(
          () {
            if (controller.isLoading.value &&
                controller.allNotifikasi.value.notifikasi.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            final groupedNotifications = controller.groupNotifikasiByDate(
                controller.allNotifikasi.value.notifikasi);

            return NotificationListener<ScrollNotification>(
              onNotification: (scrollInfo) {
                if (!controller.isLoading.value &&
                    scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent) {
                  controller.fetchNotifikasi();
                }
                return true;
              },
              child: ListView.builder(
                itemCount: groupedNotifications.length,
                itemBuilder: (context, index) {
                  String category = groupedNotifications.keys.elementAt(index);
                  List<Notifikasi> notifications =
                      groupedNotifications[category]!;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle(category),
                      ...notifications
                          .map((notif) => NotifikasiTile(notif))
                          .toList(),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 0),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }
}
