import 'package:get/get.dart';
import 'package:newcity/api.dart';
import 'package:newcity/model.dart';

class TopikBeritaController extends GetxController {
  var allBerita = Rx<BeritaResponsePagination>(BeritaResponsePagination());
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
    try {
      var response = await ApiService.getBeritaByKategori(id);
      allBerita.value = response!;
    } catch (e) {
      print('Error fetching berita: $e');
    }
  }
}
