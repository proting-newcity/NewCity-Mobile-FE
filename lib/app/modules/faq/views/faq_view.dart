import 'package:flutter/material.dart';
import 'package:newcity/themes/colors.dart';
import 'package:get/get.dart';
import '../controllers/faq_controller.dart';
import 'package:newcity/themes/text_theme.dart';
import 'package:newcity/themes/radius.dart';
import 'package:newcity/themes/size_box.dart';

class FaqView extends GetView<FaqController> {
  FaqView({super.key});
  final List<Map<String, String>> faqs = [
    {
      "question": "Kenapa tidak bisa unggah foto?",
      "answer": "Pastikan izin kamera atau penyimpanan diaktifkan."
    },
    {
      "question": "Kenapa status saya tidak diperbarui?",
      "answer": "Coba refresh halaman atau periksa koneksi internet."
    },
    {
      "question": "Tidak bisa ubah kata sandi?",
      "answer": "Pastikan kata sandi lama benar sebelum mengganti."
    },
    {
      "question": "Laporan tidak bisa diunggah?",
      "answer": "Cek apakah semua data sudah diisi dengan benar."
    },
    {
      "question": "Tidak bisa simpan laporan?",
      "answer": "Coba periksa kembali koneksi internet dan server."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "FAQ",
          style: boldBlack14,
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/faq.png", width: 260),
              sBoxh20,
              Text(
                'Ada masalah? Berikut jawaban atas pertanyaan umum yang mungkin membantu!',
                textAlign: TextAlign.center,
              ),
              sBoxh20,
              Expanded(
                child: ListView(
                  children: faqs.map((faq) {
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: borderXxxxlCircular,
                            border: Border.all(
                              color: backgroundColor,
                              width: 1,
                            ),
                          ),
                          child: ExpansionTile(
                            title: Text(faq["question"]!,
                                style: TextStyle(
                                    color: Color.fromRGBO(88, 129, 87, 1))),
                            childrenPadding: EdgeInsets.all(16),
                            collapsedIconColor: backgroundColor,
                            collapsedTextColor: backgroundColor,
                            iconColor: backgroundColor,
                            textColor: backgroundColor,
                            collapsedShape: RoundedRectangleBorder(
                              borderRadius: borderXxxxlCircular,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: borderXxxxlCircular,
                            ),
                            children: [
                              Text(faq["answer"]!,
                                  style: regularBackgroundColor14),
                            ],
                          ),
                        ),
                        sBoxh10,
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
