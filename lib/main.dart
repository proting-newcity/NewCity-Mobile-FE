import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';

import 'package:intl/date_symbol_data_local.dart';

import 'app/routes/app_pages.dart';

import 'camera.dart';

import 'theme.dart';


void main() async {
  await GetStorage.init();
  setUpCameraDelegate();
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  runApp(
    GetMaterialApp(
      title: "Application",
      theme: CustomTheme.lightTheme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
