import 'package:get/get.dart';
import 'package:newcity/api.dart';
import 'package:newcity/models/report.dart';

class DetailLaporanController extends GetxController {
  var report = Rx<ReportResponse?>(null);

  final count = 0.obs;
  @override
  void onInit() {
    fetchReport(Get.arguments);
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

  void fetchReport(int id) async {
    try {
      var response = await ApiService.getReport(id);
      report.value = response;
    } catch (e) {
      print('Error fetching berita: $e');
    }
  }
}
