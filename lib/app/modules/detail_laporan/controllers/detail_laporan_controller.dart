import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newcity/services/report_service.dart';
import 'package:newcity/models/report.dart';
import 'package:newcity/widgets/comments.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailLaporanController extends GetxController {
  var report = Rx<ReportResponse?>(null);
  Rx<int> likes = 0.obs;
  Rx<int> commentsCount = 0.obs;
  Rx<bool> isLiked = false.obs;
  Rx<bool> isBookmarked = false.obs;
  var comments = <Comment>[].obs;
  var isLoadingComments = false.obs;
  var commentError = ''.obs;
  final TextEditingController contentController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    fetchReport(Get.arguments);
    likes.value = report.value?.like ?? 0;
    commentsCount.value = report.value?.comment ?? 0;
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
      var response = await ReportService.getReportDetail(id);
      report.value = response;
      likes.value = response?.like ?? 0;
      commentsCount.value = response?.comment ?? 0;
      isLiked.value = response?.hasLiked ?? false;
      isBookmarked.value = response?.hasBookmark ?? false;
    } catch (e) {
      print('Error fetching berita: $e');
    }
  }

  void showCommentsModal(BuildContext context, int? reportId) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return ShowComment(context, reportId, contentController);
      },
    );
  }

  void fetchComments(int reportId) async {
    try {
      isLoadingComments(true);
      commentError('');
      var fetchedComments = await ReportService.getComments(reportId);
      if (fetchedComments != null && fetchedComments.isNotEmpty) {
        comments.assignAll(fetchedComments);
      } else {
        comments.clear();
        commentError('No comments available.');
      }
    } catch (e) {
      commentError('Failed to load comments.');
    } finally {
      isLoadingComments(false);
    }
  }

  Future<void> addComment(String content) async {
    try {
      final response =
          await ReportService.postComment(report.value!.report.id!, content);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar("Success", "Comment submitted successfully!",
            snackPosition: SnackPosition.BOTTOM);
        commentsCount.value++;
      } else {
        Get.snackbar("Error", "Failed to submit comment.",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print(e);
    }
  }

  void toggleLike() {
    ReportService.toggleLikeReport(report.value!.report.id!);
    if (isLiked.value) {
      likes.value--;
    } else {
      likes.value++;
    }
    isLiked.value = !isLiked.value;
  }

  void toggleBookmark() {
    ReportService.toggleBookmark(report.value!.report.id!);
    isBookmarked.value = !isBookmarked.value;
  }

  List<dynamic> getStatusState(int indeks) {
    if (indeks == 1) {
      return [Color.fromRGBO(250, 178, 45, 1), 'Dalam Proses'];
    } else if (indeks == 2) {
      return [Color.fromRGBO(171, 192, 171, 1), 'Tindak Lanjut'];
    } else {
      return [Color.fromRGBO(58, 90, 64, 1), 'Selesai'];
    }
  }

  Future<void> addStatus(int id, String status) async {
    try {
      await ReportService.addStatus(id, status);
    } catch (e) {
      print(e);
    }
  }

  Future<String?> getUserRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs
        .getString('userRole'); // Nilainya bisa 'masyarakat' atau 'pemerintah'
  }
}
