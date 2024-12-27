import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        color: Colors.white,
                      ),
                      onPressed: () {},
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
                            hintText: 'Nama',
                            prefixIcon: Icon(Icons.person_2_outlined),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: controller.passwordController,
                          decoration: InputDecoration(
                            hintText: 'Kata Sandi',
                            prefixIcon: Icon(Icons.lock_outline),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {},
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
              "Dengan in isaya menyetujui\nsyarat dan ketentuan yang berlaku untuk aplikasi ini ",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
