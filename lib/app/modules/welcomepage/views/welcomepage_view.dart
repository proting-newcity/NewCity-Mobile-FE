import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/welcomepage_controller.dart';

class WelcomepageView extends GetView<WelcomepageController> {
  final WelcomepageController controller = Get.put(WelcomepageController());

  WelcomepageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/images/logo_NewCity_horizontal.png",
                    width: 200),
                SizedBox(height: 100),

                // Obx untuk merespon perubahan pada currentIndex
                Obx(() {
                  final content = controller.currentIndex;
                  return DetailPage(
                    map: WelcomepageController.list[content.value],
                  );
                }),

                SizedBox(height: 60),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      ElevatedButtonTheme(
                        data: ElevatedButtonThemeData(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF588157),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            minimumSize: Size(320, 50),
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            controller.nextContent();
                          },
                          child: Text(
                            "Lanjut",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButtonTheme(
                        data: ElevatedButtonThemeData(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF9CAC9F),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            minimumSize: Size(320, 50),
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Masuk",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.map});
  final Map map;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(map["image"], height: 250),
          SizedBox(height: 60),
          Text(
            map["title"],
            style: TextStyle(fontSize: 30),
          ),
          Text(map["description"]),
        ],
      ),
    );
  }
}
