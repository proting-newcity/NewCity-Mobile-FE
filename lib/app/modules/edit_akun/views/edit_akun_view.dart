import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_akun_controller.dart';

class EditAkunView extends GetView<EditAkunController> {
  const EditAkunView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditAkunView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EditAkunView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
