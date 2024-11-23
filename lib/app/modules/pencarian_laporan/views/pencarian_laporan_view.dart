import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pencarian_laporan_controller.dart';

class PencarianLaporanView extends GetView<PencarianLaporanController> {
  const PencarianLaporanView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PencarianLaporanView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PencarianLaporanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
