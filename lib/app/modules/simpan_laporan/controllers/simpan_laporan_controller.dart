import 'package:get/get.dart';
import 'package:newcity/models/report.dart';
import 'package:newcity/services/report_service.dart';

class SimpanLaporanController extends GetxController {
  var reports = <Report>[].obs;
  var isLoading = true.obs;
  var isLoadingMore = false.obs;
  var currentPage = 1;
  var isLastPage = false;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchReports();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void resetReports() {
    reports.clear();
    currentPage = 1;
    isLastPage = false;
  }

  void fetchReports() async {
    if (isLastPage) return;

    try {
      if (currentPage == 1) {
        isLoading(true);
      } else {
        isLoadingMore(true);
      }

      final response = await ReportService.getBookmarkedReport(currentPage);
      if (response != null) {
        if (response.report.isNotEmpty) {
          reports.addAll(response.report);
          currentPage++;
        } else {
          isLastPage = true;
        }
      } else {
        throw Exception('Failed to load laporan');
      }
    } catch (e) {
      print("Error fetching reports: $e");
    } finally {
      isLoading(false);
      isLoadingMore(false);
    }
  }
}
