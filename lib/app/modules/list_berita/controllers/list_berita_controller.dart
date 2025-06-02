import 'package:get/get.dart';
import 'package:newcity/services/berita_service.dart';
import 'package:newcity/models/berita.dart';

class ListBeritaController extends GetxController {
  var allBerita = Rx<BeritaResponsePagination>(BeritaResponsePagination());
  var allKategori = Rx<KategoriBeritaResponse>(KategoriBeritaResponse());
  var isLoading = true.obs;
  var currentPage = 0.obs;
  var hasReachedEnd = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBerita();
    fetchKategori();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchBerita() async {
    if (hasReachedEnd.value) return;

    isLoading.value = true;

    try {
      var response =
          await BeritaService.getPaginationBerita(currentPage.value + 1);
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

  void fetchKategori() async {
    try {
      var response = await BeritaService.getKategoriBerita();
      allKategori.value = response!;
    } catch (e) {
      print('Error fetching kategori: $e');
    }
  }
}
