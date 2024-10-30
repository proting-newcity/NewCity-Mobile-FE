import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_berita_controller.dart';

class ListBeritaView extends GetView<ListBeritaController> {
  const ListBeritaView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _artificialAppBar(),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Berita Untukmu",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => controller.allBerita.value.berita != null
                    ? ListView(
                        children: [
                          for (var index = 0;
                              index < controller.allBerita.value.berita!.length;
                              index++)
                            _beritaTile(
                              controller.allBerita.value.berita![index],
                              index,
                            ),
                        ],
                      )
                    : Wrap(),
              ),
            ),
            // ElevatedButton(
            //   onPressed: () => {controller.feedValues()},
            //   child: Text("gee"),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _artificialAppBar() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 13,
          ),
          child: Text(
            "Berita",
            style: TextStyle(
              fontSize: 30,
              color: Color.fromARGB(255, 44, 0, 146),
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }

  _beritaTile(beritaData, index) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 13,
        ),
        child: Text(
          beritaData.judul,
          style: TextStyle(
            fontSize: 12,
            color: Color.fromARGB(255, 44, 0, 146),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
