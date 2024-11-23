import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/hasil_pencarian_laporan_controller.dart';

class HasilPencarianLaporanView
    extends GetView<HasilPencarianLaporanController> {
  final List<Map<String, String>> reports = [
    {
      'title': 'Pengaduan Mengenai Jalanan Berlubang di Cipagalo!',
      'date': 'Senin, 21 Okt 2024 15:00 WIB',
      'category': 'Terbaru',
    },
    {
      'title': 'Hati-hati!, Banyak Lubang di Jalan Sumbawa Bandung!',
      'date': 'Senin, 21 Okt 2024 15:00 WIB',
      'category': 'Terbaru',
    },
    {
      'title': 'Pengaduan Mengenai Jalanan Berlubang di Cipagalo!',
      'date': 'Minggu, 20 Okt 2024 15:00 WIB',
      'category': 'Terbaru',
    },
    {
      'title': 'Hati-hati!, Banyak Lubang di Jalan Sumbawa Bandung!',
      'date': 'Minggu, 20 Okt 2024 15:00 WIB',
      'category': 'Terbaru',
    },
    {
      'title': 'Aspal Berlubang di Jalan Cipagalo!',
      'date': 'Minggu, 20 Okt 2024 15:00 WIB',
      'category': 'Terbaru',
    },
  ];

  HasilPencarianLaporanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hasil Pencarian',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const Text(
                'Terbaru',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              ...reports.where((report) => report['category'] == 'Terbaru').map(
                    (report) => ReportCard(
                      title: report['title']!,
                      date: report['date']!,
                    ),
                  ),
            ],
          )),
    );
  }
}

class ReportCard extends StatelessWidget {
  final String title;
  final String date;

  const ReportCard({required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Image Section
            SizedBox(
              width: 16,
            ),
            // Text section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            CircleAvatar(
              backgroundColor: Color.fromRGBO(88, 129, 87, 1),
              radius: 40,
              child: Icon(
                Icons.article,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
