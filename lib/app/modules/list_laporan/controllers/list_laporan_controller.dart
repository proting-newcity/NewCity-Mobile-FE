import 'package:get/get.dart';
import 'package:newcity/api.dart';
import 'package:newcity/models/report.dart';

class ListLaporanController extends GetxController {
  var reports = <Report>[].obs;
  var filteredReports = <Report>[].obs;
  var isLoading = true.obs;
  var isLoadingMore = false.obs;

  var currentPage = 1;
  var isLastPage = false;

  List<String> categories = [
    'Banjir',
    'Gempa Bumi',
    'Keamanan',
    'Jalan Rusak',
    '...'
  ];

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

  void fetchReports() async {
    if (isLastPage) return;
    print("response?.lastPage");

    try {
      if (currentPage == 1) {
        isLoading(true);
      } else {
        isLoadingMore(true);
      }

      final response = await ApiService.getPaginationReport(currentPage);
      print("response?.lastPage");
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

  void filterReports(String query) {
    if (query.isEmpty) {
      filteredReports.assignAll(reports);
    } else {
      filteredReports.assignAll(
        reports.where((report) =>
            report.judul.toLowerCase().contains(query.toLowerCase()) ||
            report.deskripsi.toLowerCase().contains(query.toLowerCase())),
      );
    }
  }

  void filterByCategory(String category) {
    filteredReports.assignAll(
      reports.where((report) => report.status.contains(category)),
    );
  }
}
