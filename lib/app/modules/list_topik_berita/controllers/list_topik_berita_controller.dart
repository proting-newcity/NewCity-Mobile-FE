import 'package:get/get.dart';
import 'package:newcity/models/berita.dart';
import 'package:newcity/services/berita_service.dart';

class ListTopikBeritaController extends GetxController {
  var allKategori = Rx<KategoriBeritaResponse>(KategoriBeritaResponse());
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
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

  void fetchKategori() async {
    try {
      var response = await BeritaService.getKategoriBerita();
      allKategori.value = response!;
    } catch (e) {
      print('Error fetching berita: $e');
    }
  }
}
