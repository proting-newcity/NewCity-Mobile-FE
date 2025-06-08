import 'package:flutter/material.dart';

import 'package:newcity/themes/colors.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../controllers/register_controller.dart';
import 'package:newcity/themes/text_theme.dart';
import 'package:newcity/themes/radius.dart';

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
            Text("Kode OTP", style: boldPrimaryColor1424),
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
                  child: const Text("Kirim Ulang", style: boldPrimaryColor14),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                controller.sendOtp();
                Get.toNamed('/otp');
              },
              child: const Text('Daftar', style: normalWhite14),
            ),
          ],
        ),
      ),
    );
  }
}
