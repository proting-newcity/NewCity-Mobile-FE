import 'package:flutter/material.dart';
import 'package:newcity/themes/colors.dart';
import 'package:get/get.dart';
import 'package:newcity/themes/text_theme.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                        Get.back();
                      },
                    ),
                  ),
                  Positioned(
                    top: 135,
                    left: 23,
                    child: const Text("Lupa kata sandi?", style: boldWhite24),
                  ),
                  Positioned(
                    top: 182,
                    left: 23,
                    child: const Text(
                        "Masukkan nomor telepon Anda untuk\nmengirimkan kode verifikasi!.",
                        style: normalWhite14),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        TextField(
                          controller: controller.notelpController,
                          decoration: InputDecoration(
                            hintText: 'Nomor Telpon',
                            prefixIcon: Icon(Icons.phone_in_talk_outlined,
                                color: primaryColor),
                          ),
                        ),
                        SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {
                            controller.searchnotelp();
                          },
                          child: const Text('Kirim Kode', style: boldWhite14),
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
