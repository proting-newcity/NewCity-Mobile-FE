import 'package:get/get.dart';
import 'package:newcity/services/report_service.dart';
import 'package:newcity/models/report.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

class BerandaController extends GetxController
    with GetTickerProviderStateMixin {
  var reports = <Report>[].obs;
  var isLoading = true.obs;
  var isLoadingMore = false.obs;
  var currentPage = 1;
  var isLastPage = false;
  var selectedTabIndex = 1.obs;
  late MotionTabBarController motionTabBarController;

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchReports();
    motionTabBarController =
        MotionTabBarController(initialIndex: 1, length: 3, vsync: this);
  }

  @override
  void onClose() {
    motionTabBarController.dispose();
    super.onClose();
  }

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
