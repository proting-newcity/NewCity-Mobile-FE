import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newcity/models/user.dart';
import 'package:newcity/widgets/notifikasi_tile.dart';
import 'package:newcity/themes/colors.dart';
import '../controllers/notifikasi_controller.dart';
import 'package:newcity/themes/text_theme.dart';

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
        title: const Text("Notifikasi", style: boldBlack22),
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
        elevation: 0,
        backgroundColor: whiteColor,
        foregroundColor: blackColor,
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
      child: Text(title, style: boldBlack18),
    );
  }
}
