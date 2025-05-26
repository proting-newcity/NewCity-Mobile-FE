import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newcity/theme/colors.dart';
import 'package:pinput/pinput.dart';
import '../controllers/register_controller.dart';

class OtpView extends GetView<RegisterController> {
  const OtpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OtpView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Kode OTP",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            Text(
              "Kode OTP telah terkirim ke\n+62 xx xxxx xxxx",
              textAlign: TextAlign.center,
            ),
            Pinput(
              onCompleted: (pin) => controller.nextRoute(pin),
              onSubmitted: (pin) => controller.nextRoute(pin),
              length: 4,
            ),
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
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                controller.sendOtp();
                Get.toNamed('/otp');
              },
              child: Text(
                'Daftar',
                style: TextStyle(
                  fontSize: 14,
                  color: whiteColor,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
