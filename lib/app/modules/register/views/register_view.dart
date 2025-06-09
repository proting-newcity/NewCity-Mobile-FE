import 'package:flutter/material.dart';
import 'package:newcity/themes/colors.dart';
import 'package:get/get.dart';
import 'package:newcity/themes/text_theme.dart';
import '../controllers/register_controller.dart';
import 'package:newcity/themes/size_box.dart';

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
                    top: 110,
                    left: 23,
                    child: const Text("Registrasi", style: boldWhite24),
                  ),
                  Positioned(
                    top: 150,
                    left: 23,
                    child: const Text("Buat Akun Anda!", style: normalWhite14),
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
                            hintText: 'Nama',
                            prefixIcon: Icon(Icons.person_2_outlined,
                                color: primaryColor),
                          ),
                          controller: controller.namacontroller,
                        ),
                        sBoxh20,
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Nomor Telepon',
                            prefixIcon:
                                const Icon(Icons.phone, color: primaryColor),
                          ),
                          controller: controller.notelpcontroller,
                        ),
                        sBoxh20,
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Kata Sandi',
                            prefixIcon: const Icon(Icons.lock_outline,
                                color: primaryColor),
                          ),
                          controller: controller.passwordcontroller,
                        ),
                        sBoxh30,
                        ElevatedButton(
                          onPressed: () {
                            controller.sendOtp();
                          },
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
                "dengan ini saya menyetujui\nsyarat dan ketentuan yang berlaku untuk aplikasi ini ",
                textAlign: TextAlign.center,
                style: normalBlack12),
          ),
        ],
      ),
    );
  }
}
