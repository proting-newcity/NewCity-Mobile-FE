import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SplashscreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SplashscreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
