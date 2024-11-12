import 'package:get/get.dart';

import '../modules/detail_berita/bindings/detail_berita_binding.dart';
import '../modules/detail_berita/views/detail_berita_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/list_berita/bindings/list_berita_binding.dart';
import '../modules/list_berita/views/list_berita_view.dart';
import '../modules/list_topik_berita/bindings/list_topik_berita_binding.dart';
import '../modules/list_topik_berita/views/list_topik_berita_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';
import '../modules/topik_berita/bindings/topik_berita_binding.dart';
import '../modules/topik_berita/views/topik_berita_view.dart';
import '../modules/welcomepage/bindings/welcomepage_binding.dart';
import '../modules/welcomepage/views/welcomepage_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LIST_BERITA;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => const SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.LIST_BERITA,
      page: () => const ListBeritaView(),
      binding: ListBeritaBinding(),
    ),
    GetPage(
      name: _Paths.LIST_TOPIK_BERITA,
      page: () => const ListTopikBeritaView(),
      binding: ListTopikBeritaBinding(),
    ),
    GetPage(
      name: _Paths.TOPIK_BERITA,
      page: () => const TopikBeritaView(),
      binding: TopikBeritaBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_BERITA,
      page: () => const DetailBeritaView(),
      binding: DetailBeritaBinding(),
    ),
    GetPage(
      name: _Paths.WELCOMEPAGE,
      page: () => WelcomepageView(),
      binding: WelcomepageBinding(),
    ),
  ];
}
