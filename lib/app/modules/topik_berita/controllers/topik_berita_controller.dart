import 'package:get/get.dart';
import 'package:newcity/api.dart';
import 'package:newcity/models/berita.dart';

class TopikBeritaController extends GetxController {
  var allBerita = Rx<BeritaResponsePagination>(BeritaResponsePagination());
  var isLoading = true.obs;
  var currentPage = 0.obs;
  var hasReachedEnd = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchBeritaByKategori(Get.arguments.id);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchBeritaByKategori(id) async {
    if (hasReachedEnd.value) return;

    isLoading.value = true;
    try {
      var response =
          await ApiService.getBeritaByKategori(currentPage.value, id);
      if (response != null) {
        final currentBerita = allBerita.value.berita;
        final newBerita = response.berita;
        allBerita.update((val) {
          val?.berita = List.from(currentBerita)..addAll(newBerita);
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
