import 'package:flutter/material.dart';
import 'package:newcity/theme/colors.dart';
import 'package:get/get.dart';
import 'package:newcity/theme/text_theme.dart';
import '../controllers/register_controller.dart';
import 'package:newcity/theme/radius.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
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
                    child: const Text("Registrasi",
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
                    child: const Text("Buat Akun Anda!", style: normalWhite14),
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
                          decoration: InputDecoration(
                            hintText: 'Nama',
                            hintStyle: regularPrimaryColor14,
                            prefixIcon: Icon(Icons.person_2_outlined,
                                color: primaryColor),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: primaryColor, width: 1),
                                borderRadius: borderLgCircular),
                          ),
                          controller: controller.namacontroller,
                        ),
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Nomor Telepon',
                            hintStyle: regularPrimaryColor14,
                            prefixIcon:
                                const Icon(Icons.phone, color: primaryColor),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: primaryColor, width: 1),
                                borderRadius: borderLgCircular),
                          ),
                          controller: controller.notelpcontroller,
                        ),
                        SizedBox(height: 20),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Kata Sandi',
                            hintStyle: regularPrimaryColor14,
                            prefixIcon: const Icon(Icons.lock_outline,
                                color: primaryColor),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: primaryColor, width: 1),
                                borderRadius: borderLgCircular),
                          ),
                          controller: controller.passwordcontroller,
                        ),
                        SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {
                            controller.sendOtp();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: borderXlCircular,
                            ),
                          ),
                          child: const Text('Daftar', style: normalWhite14),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Sudah punya akun?"),
                            TextButton(
                              onPressed: () {
                                Get.toNamed('/login');
                              },
                              child: const Text("Masuk",
                                  style: boldPrimaryColor14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20),
            child: const Text(
                "dengan in isaya menyetujui\nsyarat dan ketentuan yang berlaku untuk aplikasi ini ",
                textAlign: TextAlign.center,
                style: normalBlack12),
          ),
        ],
      ),
    );
  }
}
