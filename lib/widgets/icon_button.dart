import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newcity/themes/size_box.dart';

Widget BuildIconButton(String name, String label, String route) {
  return GestureDetector(
    child: Column(
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundColor: Color(0xFF588157),
          child: Image.asset(name),
        ),
        sBoxh4,
        Text(label, style: TextStyle(color: Color(0xFF588157))),
      ],
    ),
    onTap: () {
      Get.toNamed(route);
    },
  );
}
