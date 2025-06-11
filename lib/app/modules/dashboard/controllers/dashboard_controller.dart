import 'package:get/get.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

class DashboardController extends GetxController
    with GetTickerProviderStateMixin {
  // Variable to store the current tab index
  final RxInt tabIndex = 0.obs;

  // MotionTabBar controller
  late MotionTabBarController motionTabBarController;

  @override
  void onInit() {
    super.onInit();
    // Initialize the MotionTabBarController
    motionTabBarController = MotionTabBarController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  void onClose() {
    super.onClose();
    motionTabBarController.dispose();
  }

  // Function to change the tab
  void changeTab(int index) {
    tabIndex.value = index;
  }
}
