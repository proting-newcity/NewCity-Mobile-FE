import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newcity/models/user.dart';
import 'package:newcity/services/user_service.dart';

class NotifikasiController extends GetxController {
  var allNotifikasi = Rx<NotifikasiPagination>(NotifikasiPagination());
  var isLoading = true.obs;
  var currentPage = 0.obs;
  var hasReachedEnd = false.obs;
  @override
  void onInit() {
    fetchNotifikasi();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchNotifikasi() async {
    if (hasReachedEnd.value) return;

    isLoading.value = true;

    try {
      var response = await UserService.getNotifikasi(currentPage.value + 1);
      if (response != null) {
        final currentNotifikasi = allNotifikasi.value.notifikasi;
        final newNotifikasi = response.notifikasi;
        allNotifikasi.update((val) {
          val?.notifikasi = List.from(currentNotifikasi)..addAll(newNotifikasi);
          val?.lastPage = response.lastPage;
        });
        currentPage.value++;
        if (currentPage.value >= response.lastPage!) {
          hasReachedEnd.value = true;
        }
      }
    } catch (e) {
      print('Error fetching notifikasi: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Map<String, List<Notifikasi>> groupNotifikasiByDate(
      List<Notifikasi> notifikasiList) {
    Map<String, List<Notifikasi>> grouped = {};

    final now = DateTime.now();
    for (var notif in notifikasiList) {
      DateTime notifDate =
          DateFormat("yyyy-MM-dd HH:mm:ss").parse(notif.tanggal);
      Duration difference = now.difference(notifDate);

      String category;
      if (difference.inDays == 0) {
        category = "Terbaru";
      } else if (difference.inDays == 1) {
        category = "Kemarin";
      } else if (difference.inDays <= 7) {
        category = "Minggu Ini";
      } else {
        category = "Lebih Lama";
      }

      if (!grouped.containsKey(category)) {
        grouped[category] = [];
      }
      grouped[category]!.add(notif);
    }

    return grouped;
  }
}
