import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newcity/theme/text_theme.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HomeView is working',
          style: normalBlack20,
        ),
      ),
    );
  }
}
