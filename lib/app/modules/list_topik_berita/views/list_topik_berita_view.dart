import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_topik_berita_controller.dart';

class ListTopikBeritaView extends GetView<ListTopikBeritaController> {
  const ListTopikBeritaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListTopikBeritaView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListTopikBeritaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
