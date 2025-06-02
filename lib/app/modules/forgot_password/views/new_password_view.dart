import 'package:flutter/material.dart';
import 'package:newcity/theme/colors.dart';
import 'package:newcity/theme/text_theme.dart';
import 'package:get/get.dart';
import '../controllers/forgot_password_controller.dart';
import 'package:newcity/theme/Radius.dart';

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
                    child: Text("Kata Sandi Baru",
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
                    child: Text("Buat Kata Sandi Baru.", style: regularWhite),
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
                          controller: controller.passwordController,
                          decoration: InputDecoration(
                            hintText: 'Kata Sandi Baru',
                            hintStyle: regularPrimaryColor,
                            prefixIcon:
                                Icon(Icons.lock_outline, color: primaryColor),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: primaryColor, width: 1),
                                borderRadius: borderLgCircular),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: controller.passwordConfirmationController,
                          decoration: InputDecoration(
                            hintText: 'Konfirmasi Kata Sandi',
                            hintStyle: regularPrimaryColor,
                            prefixIcon:
                                Icon(Icons.lock_outline, color: primaryColor),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: primaryColor, width: 1),
                                borderRadius: borderLgCircular),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            controller.changePassword();
                          },
                          child:
                              Text('Buat Kata Sandi Baru', style: regularWhite),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: borderXlCircular,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
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
