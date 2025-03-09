import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

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
                      "Selamat Datang",
                      // style: GoogleFonts.poppins(
                      //   color: Colors.white,
                      //   fontSize: 24,
                      //   fontWeight: FontWeight.bold,
                      // ),
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
                      "Senang Melihatmu Kembali.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
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
                          controller: controller.usernameController,
                          decoration: InputDecoration(
                            hintText: 'Nomor Telpon',
                            hintStyle: TextStyle(
                              color: Color(0xFF588157),
                            ),
                            prefixIcon: Icon(Icons.phone_outlined,
                                color: Color(0xFF588157)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFF588157), width: 1),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          obscureText: true,
                          controller: controller.passwordController,
                          decoration: InputDecoration(
                            hintText: 'Kata Sandi',
                            hintStyle: TextStyle(
                              color: Color(0xFF588157),
                            ),
                            prefixIcon: Icon(Icons.lock_outline,
                                color: Color(0xFF588157)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFF588157), width: 1),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {
                                Get.toNamed('/forgot-password');
                              },
                              child: Text(
                                "Lupa kata sandi?",
                                style: TextStyle(
                                  color: Color(0xFF588157),
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            controller.login();
                          },
                          child: Text(
                            'Masuk',
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
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Belum punya akun?"),
                            TextButton(
                              onPressed: () {
                                Get.toNamed('/register');
                              },
                              child: Text(
                                "Daftar",
                                style: TextStyle(
                                  color: Color(0xFF588157),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
            child: Text(
              "Dengan ini saya menyetujui\nsyarat dan ketentuan yang berlaku untuk aplikasi ini ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: true),
            ),
          ),
        ],
      ),
    );
  }
}
