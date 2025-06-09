import 'package:flutter/material.dart';
import 'package:newcity/themes/colors.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../controllers/forgot_password_controller.dart';
import 'package:newcity/themes/text_theme.dart';

class KodeVerifikasiView extends GetView<ForgotPasswordController> {
  const KodeVerifikasiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
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
                child: const Text("Kode Verivikasi", style: boldWhite24),
              ),
              Positioned(
                top: 182,
                left: 23,
                child: const Text(
                    "Anda perlu memasukkan kode 4 digit yang\nkami kirim ke nomor telepon Anda.",
                    style: normalWhite14),
              ),
            ],
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Pinput(
                  onCompleted: (pin) => controller.nextRoute(pin),
                  onSubmitted: (pin) => controller.nextRoute(pin),
                  length: 4,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Kode belum masuk?"),
                    TextButton(
                      onPressed: () {
                        Get.toNamed('/login');
                      },
                      child:
                          const Text("Kirim Ulang", style: boldPrimaryColor14),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    controller.sendOtp();
                    Get.toNamed('/otp');
                  },
                  child: const Text('Verivikasi', style: normalWhite14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
