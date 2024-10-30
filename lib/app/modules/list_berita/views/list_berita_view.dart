import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_berita_controller.dart';

class ListBeritaView extends GetView<ListBeritaController> {
  const ListBeritaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListBeritaView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListBeritaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
