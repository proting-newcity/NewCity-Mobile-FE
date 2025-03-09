import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

// import 'package:google_fonts/google_fonts.dart';

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
                      "Registrasi",
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
                      "Buat Akun Anda!",
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
                          decoration: InputDecoration(
                            hintText: 'Nama',
                            hintStyle: TextStyle(
                              color: Color(0xFF588157),
                            ),
                            prefixIcon: Icon(Icons.person_2_outlined,
                                color: Color(0xFF588157)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFF588157), width: 1),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          controller: controller.namacontroller,
                        ),
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Nomor Telepon',
                            hintStyle: TextStyle(
                              color: Color(0xFF588157),
                            ),
                            prefixIcon:
                                Icon(Icons.phone, color: Color(0xFF588157)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFF588157), width: 1),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          controller: controller.notelpcontroller,
                        ),
                        SizedBox(height: 20),
                        TextField(
                          obscureText: true,
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
                          controller: controller.passwordcontroller,
                        ),
                        SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {
                            controller.sendOtp();
                          },
                          child: Text(
                            'Daftar',
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Sudah punya akun?"),
                            TextButton(
                              onPressed: () {
                                Get.toNamed('/login');
                              },
                              child: Text(
                                "Masuk",
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
              "dengan in isaya menyetujui\nsyarat dan ketentuan yang berlaku untuk aplikasi ini ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
