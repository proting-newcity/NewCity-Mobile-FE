import 'package:get/get.dart';
import 'package:newcity/api.dart';
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
    try {
      var response = await ApiService.getPaginationBerita(currentPage.value);
      allBerita.value = response!;
      currentPage++;
      if (currentPage >= allBerita.value.lastPage!) {
        hasReachedEnd.value = true;
      }
    } catch (e) {
      print('Error fetching berita: $e');
    }
  }

  void fetchKategori() async {
    try {
      var response = await ApiService.getKategori();
      allKategori.value = response!;
    } catch (e) {
      print('Error fetching berita: $e');
    }
  }
}
