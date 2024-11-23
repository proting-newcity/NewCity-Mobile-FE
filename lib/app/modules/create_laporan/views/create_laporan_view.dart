import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/create_laporan_controller.dart';

class CreateLaporanView extends GetView<CreateLaporanController> {
  const CreateLaporanView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isAnonim = false;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Buat Laporan",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text("Data Diri", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: "Nama",
                hintText: "Masukkan nama",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: "Nomor Telepon",
                hintText: "Masukkan nomor telepon",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Masukkan email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Checkbox(value: isAnonim, onChanged: (bool? value) {}),
                Text("Buat laporan sebagai anonim"),
              ],
            ),
            SizedBox(height: 20),
            Text("Deskripsi", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Container(
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Icon(Icons.camera_alt, color: Colors.green),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: "Lokasi",
                hintText: "Masukkan lokasi",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                labelText: "Detail Laporan",
                hintText: "Masukkan detail dari laporan mu disini",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text("Pilih Topik", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: [
                _buildTopicChip("Keamanan"),
                _buildTopicChip("Lalu Lintas"),
                _buildTopicChip("Kebersihan"),
                _buildTopicChip("Infrastruktur"),
                _buildTopicChip("Banjir"),
                _buildTopicChip("Jalan Rusak"),
                _buildTopicChip("Transportasi Umum"),
                _buildTopicChip("Kehilangan"),
                _buildTopicChip("Lainnya..."),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text("Berikutnya"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopicChip(String label) {
    return ChoiceChip(
      label: Text(label),
      selected: false,
      onSelected: (bool selected) {},
      backgroundColor: Colors.white,
      selectedColor: Colors.green,
      labelStyle: TextStyle(color: Colors.black),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.green),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
