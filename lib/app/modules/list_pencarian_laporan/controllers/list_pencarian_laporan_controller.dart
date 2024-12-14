import 'package:get/get.dart';
import 'package:newcity/api.dart';
import 'package:newcity/models/report.dart';

class ListPencarianLaporanController extends GetxController {
  var allReport = Rx<ReportResponsePagination>(ReportResponsePagination());
  var isLoading = true.obs;
  var currentPage = 0.obs;
  var hasReachedEnd = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchReportbySearch(Get.arguments.keyword);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchReportbySearch(String keyword) async {
    if (hasReachedEnd.value) return;

    isLoading.value = true;

    try {
      var response =
          await ApiService.getSearchedReport(currentPage.value, keyword);
      if (response != null) {
        final currentReport = allReport.value.report;
        final newReport = response.report;
        allReport.update((val) {
          val?.report = List.from(currentReport)..addAll(newReport);
          val?.lastPage = response.lastPage;
        });
        currentPage.value++;
        if (currentPage.value >= response.lastPage!) {
          hasReachedEnd.value = true;
        }
      }
    } catch (e) {
      print('Error fetching berita: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
