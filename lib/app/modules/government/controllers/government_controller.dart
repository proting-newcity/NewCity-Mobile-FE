import 'package:get/get.dart';
import 'package:newcity/services/report_service.dart';
import 'package:newcity/models/report.dart';

class GovernmentController extends GetxController {
  var report = Rx<ReportResponse?>(null);
  var reports = <Report>[].obs;
  var filteredReports = <Report>[].obs;
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

  void increment() => count.value++;

  void fetchReports() async {
    if (isLastPage) return;

    try {
      if (currentPage == 1) {
        isLoading(true);
      } else {
        isLoadingMore(true);
      }

      final response = await ReportService.getReport(currentPage);
      if (response != null) {
        if (response.report.isNotEmpty) {
          reports.addAll(response.report);
          filteredReports.addAll(response.report);
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
