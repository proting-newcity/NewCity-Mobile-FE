import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

import 'camera.dart';

import 'theme.dart';

void main() {
  setUpCameraDelegate();
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
