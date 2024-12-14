import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_pencarian_laporan_controller.dart';
import 'package:newcity/widgets/berita_tile.dart';

class ListPencarianLaporanView extends GetView<ListPencarianLaporanController> {
  const ListPencarianLaporanView({super.key});
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
            ],
          )),
    );
  }
}
