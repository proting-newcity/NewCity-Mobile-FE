import 'package:get/get.dart';
import 'package:newcity/api.dart';
import 'package:newcity/models/report.dart';

class ListLaporanController extends GetxController {
  var allKategori = Rx<KategoriReportResponse>(KategoriReportResponse());
  var reports = <Report>[].obs;
  var filteredReports = <Report>[].obs;
  var isLoading = true.obs;
  var isLoadingMore = false.obs;
  var currentPage = 1;
  var isLastPage = false;

  Rx<int> selectedTopics = Rx<int>(-1);

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchReports();
    fetchKategori();

    ever(selectedTopics, (selectedId) {
      resetReports();
      if (selectedId != -1) {
        fetchReportsbyKategori(allKategori.value.kategori[selectedId].id);
      } else {
        fetchReports();
      }
    });
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
    filteredReports.clear();
    currentPage = 1;
    isLastPage = false;
  }

  void fetchKategori() async {
    try {
      var response = await ApiService.getKategoriReport();
      allKategori.value = response!;
    } catch (e) {
      print('Error fetching Kategori: $e');
    }
  }

  void fetchReports() async {
    if (isLastPage) return;

    try {
      if (currentPage == 1) {
        isLoading(true);
      } else {
        isLoadingMore(true);
      }

      final response = await ApiService.getPaginationReport(currentPage);
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

  void fetchReportsbyKategori(id) async {
    if (isLastPage) return;

    try {
      if (currentPage == 1) {
        isLoading(true);
      } else {
        isLoadingMore(true);
      }

      final response = await ApiService.getReportByKategori(currentPage, id);
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
