import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newcity/themes/colors.dart';
import '../controllers/lupa_password_controller.dart';
import 'package:newcity/themes/text_theme.dart';
import 'package:newcity/themes/size_box.dart';

class LupaPasswordView extends GetView<LupaPasswordController> {
  const LupaPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Image.asset("assets/images/background1.png"),
                  Positioned(
                    top: 58,
                    left: 10,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: whiteColor,
                      ),
                      onPressed: () {
                        Get.toNamed('/biodata-page');
                      },
                    ),
                  ),
                  Positioned(
                    top: 135,
                    left: 23,
                    child: const Text("Buat Kata Sandi Baru",
                        // style: GoogleFonts.poppins(
                        //   color: whiteColor,
                        //   fontSize: 24,
                        //   fontWeight: FontWeight.bold,
                        // ),
                        style: boldWhite24),
                  ),
                  Positioned(
                    top: 182,
                    left: 23,
                    child: const Text("Masukkan kata sandi baru Anda.",
                        style: normalWhite14),
                  ),
                ],
              ),
              sBoxh30,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Kata Sandi',
                            prefixIcon: Icon(Icons.lock),
                          ),
                          controller: controller.notelpcontroller,
                        ),
                        sBoxh20,
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Konfirmasi Kata Sandi',
                            prefixIcon: Icon(Icons.lock),
                          ),
                          controller: controller.passwordcontroller,
                        ),
                        sBoxh30,
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          onPressed: () {
                            controller.sendOtp();
                          },
                          child: const Text('Ubah Kata Sandi',
                              style: normalWhite14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
