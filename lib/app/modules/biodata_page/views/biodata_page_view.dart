import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/biodata_page_controller.dart';

class BiodataPageView extends GetView<BiodataPageController> {
  const BiodataPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Akun'),
        backgroundColor: Color(0xFF588157),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 110,
              decoration: BoxDecoration(
                color: Color(0xFF588157),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(MediaQuery.of(context).size.width / 1, 110),
                  bottomRight: Radius.elliptical(MediaQuery.of(context).size.width / 1, 110),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 5), //Jarak PP dari atas appbar
                CircleAvatar(
                  radius: 88,
                  child: Icon(Icons.person, size: 50),
                ),
                SizedBox(height: 16),
                Text(
                  'Anomaly',
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'anomaly@gmail.com | +62 8123-4567-9810',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                ListTile(
                  title: Text(
                    'Ubah Kata Sandi',
                    style: TextStyle(fontSize: 22),
                  ),
                  onTap: () {
                    // Untuk ubah password
                  },
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Akun',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    // Navigator.pushNamed(context, '/edit');
                  },
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Bantuan',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    // Navigasi ke halaman bantuan
                  },
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Keluar',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    // Log out dari akun
                  },
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF588157),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report),
            label: 'Lapor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}
