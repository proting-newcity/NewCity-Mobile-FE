import 'package:flutter/material.dart';
import 'package:newcity/themes/colors.dart';
import 'package:newcity/themes/text_theme.dart';
import 'package:get/get.dart';
import '../controllers/forgot_password_controller.dart';
import 'package:newcity/themes/size_box.dart';

class NewPasswordView extends GetView<ForgotPasswordController> {
  const NewPasswordView({super.key});
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
                    child: const Text("Kata Sandi Baru",
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
                    child: const Text("Buat Kata Sandi Baru.",
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
                          controller: controller.passwordController,
                          decoration: InputDecoration(
                            hintText: 'Kata Sandi Baru',
                            prefixIcon: const Icon(Icons.lock_outline,
                                color: primaryColor),
                          ),
                        ),
                        sBoxh20,
                        TextField(
                          controller: controller.passwordConfirmationController,
                          decoration: InputDecoration(
                            hintText: 'Konfirmasi Kata Sandi',
                            prefixIcon:
                                Icon(Icons.lock_outline, color: primaryColor),
                          ),
                        ),
                        sBoxh20,
                        ElevatedButton(
                          onPressed: () {
                            controller.changePassword();
                          },
                          child: const Text('Buat Kata Sandi Baru',
                              style: normalWhite14),
                        ),
                        sBoxh20,
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
