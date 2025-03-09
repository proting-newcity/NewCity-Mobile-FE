import 'package:get/get.dart';
import 'package:newcity/api.dart';
import 'package:newcity/models/report.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import '../views/beranda_view.dart';

class BerandaController extends GetxController
    with GetTickerProviderStateMixin {
  var reports = <Report>[].obs;
  var filteredReports = <Report>[].obs;
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
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    motionTabBarController!.dispose();
    super.onClose();
  }

  void changeTab(int index) {
    // selectedTabIndex.value = index;
    // motionTabBarController.index = index;
    switch (index) {
      case 0:
        Get.toNamed('/beranda', preventDuplicates: false);
        break;
      case 1:
        Get.toNamed('/create-laporan', preventDuplicates: false);
        break;
      case 2:
        Get.toNamed('/biodata-page', preventDuplicates: false);
        break;
    }
  }

  void increment() => count.value++;

  void fetchReports() async {
    print("uygygugyugyuygugyugyuyguyguuyg");
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
}
