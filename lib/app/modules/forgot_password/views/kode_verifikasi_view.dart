import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../controllers/forgot_password_controller.dart';

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
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              Positioned(
                top: 135,
                left: 23,
                child: Text(
                  "Kode Verivikasi",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 182,
                left: 23,
                child: Text(
                  "Anda perlu memasukkan kode 4 digit yang\nkami kirim ke nomor telepon Anda.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
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
                      child: Text(
                        "Kirim Ulang",
                        style: TextStyle(
                          color: Color(0xFF588157),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    controller.sendOtp();
                    Get.toNamed('/otp');
                  },
                  child: Text(
                    'Verivikasi',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF588157),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
