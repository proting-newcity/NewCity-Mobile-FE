import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newcity/themes/colors.dart';
import '../controllers/login_controller.dart';
import 'package:newcity/themes/text_theme.dart';
import 'package:newcity/themes/size_box.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Image.asset("assets/images/background1.png"),
                  Positioned(
                    top: 110,
                    left: 23,
                    child: const Text("Selamat Datang", style: boldWhite24),
                  ),
                  Positioned(
                    top: 150,
                    left: 23,
                    child: const Text("Senang Melihatmu Kembali.",
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
                          controller: controller.usernameController,
                          decoration: InputDecoration(
                            hintText: 'Nomor Telpon',
                            prefixIcon: const Icon(Icons.phone_outlined,
                                color: primaryColor),
                          ),
                        ),
                        sBoxh20,
                        TextField(
                          obscureText: true,
                          controller: controller.passwordController,
                          decoration: InputDecoration(
                            hintText: 'Kata Sandi',
                            prefixIcon:
                                Icon(Icons.lock_outline, color: primaryColor),
                          ),
                        ),
                        sBoxh10,
                        Container(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {
                                Get.toNamed('/forgot-password');
                              },
                              child: const Text("Lupa kata sandi?",
                                  style: boldPrimaryColor14)),
                        ),
                        sBoxh10,
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          onPressed: () {
                            controller.login();
                          },
                          child: const Text('Masuk', style: normalWhite14),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Belum punya akun?"),
                            TextButton(
                              onPressed: () {
                                Get.toNamed('/register');
                              },
                              child: const Text("Daftar",
                                  style: regularPrimaryColor14),
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
              "Dengan ini saya menyetujui\nsyarat dan ketentuan yang berlaku untuk aplikasi ini ",
              textAlign: TextAlign.center,
              style: normalBlack12,
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: true),
            ),
          ),
        ],
      ),
    );
  }
}
