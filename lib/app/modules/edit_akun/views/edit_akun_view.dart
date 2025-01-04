import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/edit_akun_controller.dart';

class EditAkunView extends GetView<EditAkunController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Akun'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 5),
            CircleAvatar(
              radius: 88,
              child: Icon(Icons.person, size: 50),
            ),
            Text(
              'Ubah foto',
              style: TextStyle(color: Color(0xFF588157)),
            ),
            SizedBox(height: 16),
            TextField(
                decoration: InputDecoration(
                  hintText: 'Nama',
                  prefixIcon: Icon(Icons.person_2_outlined),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  controller.updateName(value);
                }),
            SizedBox(height: 20),
            TextField(
                decoration: InputDecoration(
                  hintText: 'Telepon',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  controller.updateName(value);
                }),
            SizedBox(height: 20),
            TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.mail),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  controller.updateName(value);
                }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save changes and navigate back
                Get.back();
              },
              child: Text('Simpan Perubahan',
              style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF588157),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
