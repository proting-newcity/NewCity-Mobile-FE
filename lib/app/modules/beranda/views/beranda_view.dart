import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../controllers/beranda_controller.dart';

class BerandaView extends GetView<BerandaController> {
  const BerandaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text('Selamat datang!'),
            Text(
              DateFormat('EEEE dd MMMM yyyy', 'id_ID').format(DateTime.now()),
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Cari berita terbaru',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIconButton(Icons.note, 'Laporan'),
                _buildIconButton(Icons.article, 'Berita'),
                _buildIconButton(Icons.bookmark, 'Simpan'),
                _buildIconButton(Icons.notifications, 'Notifikasi'),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Rekomendasi Untukmu',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            _buildRecommendationCard(
              'Hati-hati, Banyak Lubang di Jalan Sumbawa Bandung!',
              'Sion, 22 Okt 2024, 13:00 WIB',
              'assets/images/road_with_holes.jpg',
            ),
            SizedBox(height: 16.0),
            Text(
              'Bukannya Berkurang, Sampah dari Kota Bandung ke Sarimukti Justru Melonjak!',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            _buildRecommendationCard(
              '',
              'Selasa, 5 Des 2023, 14:00 WIB',
              'assets/images/trash_pile.jpg',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.report), label: 'Lapor'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Akun'),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24.0,
          backgroundColor: Colors.green,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 4.0),
        Text(label),
      ],
    );
  }

  Widget _buildRecommendationCard(String title, String date, String imagePath) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (imagePath.isNotEmpty)
            Image.asset(
              imagePath,
              width: double.infinity,
              height: 150.0,
              fit: BoxFit.cover,
            ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title.isNotEmpty)
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                SizedBox(height: 8.0),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey,
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
