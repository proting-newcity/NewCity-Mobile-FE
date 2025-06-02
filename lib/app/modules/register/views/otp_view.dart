import 'package:flutter/material.dart';

import 'package:newcity/theme/colors.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../controllers/register_controller.dart';
import 'package:newcity/theme/text_theme.dart';

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
            Text("Kode OTP", style: boldPrimaryColor24),
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
                  child: Text("Kirim Ulang", style: boldPrimaryColor),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                controller.sendOtp();
                Get.toNamed('/otp');
              },
              child: Text('Daftar', style: regularWhite),
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
