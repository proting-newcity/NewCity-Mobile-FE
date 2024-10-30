import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/welcomepage_controller.dart';

class WelcomepageView extends GetView<WelcomepageController> {
  const WelcomepageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo_NewCity_horizontal.png",
                  width: 200),
              SizedBox(height: 50),
              Image.asset("assets/images/img_welcomepage1.png")
            ],
          ),
        ),
      ),
    );
  }
}
