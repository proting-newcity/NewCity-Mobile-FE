import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/topik_berita_controller.dart';

class TopikBeritaView extends GetView<TopikBeritaController> {
  const TopikBeritaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TopikBeritaView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TopikBeritaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
