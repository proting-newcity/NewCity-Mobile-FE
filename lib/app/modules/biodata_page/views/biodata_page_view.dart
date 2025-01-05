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
                SizedBox(height: 5),
                CircleAvatar(
                  radius: 88,
                  child: Icon(Icons.person, size: 50),
                ),
                SizedBox(height: 16),
                Obx(() {
                  return Text(
                    controller.userName.value,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),
                SizedBox(height: 8),
                Obx(() {
                  return Text(
                    '${controller.userEmail.value} | ${controller.userPhone.value}',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  );
                }),
                SizedBox(height: 16),
                ListTile(
                  title: Text(
                    'Ubah Kata Sandi',
                    style: TextStyle(fontSize: 22),
                  ),
                  onTap: () {
                    Get.toNamed('/lupa-password');
                  },
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Akun',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Get.toNamed('/edit-akun');
                  },
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Bantuan',
                    style: TextStyle(fontSize: 20),
                  ), 
                  onTap: () {
                    // Navigate to help page
                  },
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Keluar',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    _showLogoutDialog(context);
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
            icon: Icon(Icons.camera),
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

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Konfirmasi Keluar"),
          content: Text("Apakah Anda yakin ingin keluar?"),
          actions: [
            TextButton(
              child: Text("Batal"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Lanjut"),
              onPressed: () {
                Navigator.of(context).pop();
                Get.toNamed('/login');
              },
            ),
          ],
        );
      },
    );
  }
}
