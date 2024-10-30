import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_berita_controller.dart';

class DetailBeritaView extends GetView<DetailBeritaController> {
  const DetailBeritaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailBeritaView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailBeritaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
