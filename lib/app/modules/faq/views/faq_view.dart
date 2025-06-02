import 'package:flutter/material.dart';
import 'package:newcity/theme/colors.dart';
import 'package:get/get.dart';
import '../controllers/faq_controller.dart';
import 'package:newcity/theme/text_theme.dart';

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
        title: Text(
          "FAQ",
          style: boldText,
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/faq.png", width: 260),
              SizedBox(height: 20),
              Text(
                'Ada masalah? Berikut jawaban atas pertanyaan umum yang mungkin membantu!',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: faqs.map((faq) {
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: backgroundColor,
                              width: 1,
                            ),
                          ),
                          child: ExpansionTile(
                            title: Text(faq["question"]!, style: bold16),
                            childrenPadding: EdgeInsets.all(16),
                            collapsedIconColor: backgroundColor,
                            collapsedTextColor: backgroundColor,
                            iconColor: backgroundColor,
                            textColor: backgroundColor,
                            collapsedShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            children: [
                              Text(faq["answer"]!,
                                  style: regularBackgroundColor),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
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
