import 'package:flutter/material.dart';
import 'package:newcity/theme/colors.dart';
import 'package:get/get.dart';
import '../controllers/welcomepage_controller.dart';
import 'package:newcity/theme/text_theme.dart';
import 'package:newcity/theme/Radius.dart';

class WelcomepageView extends GetView<WelcomepageController> {
  final WelcomepageController controller = Get.put(WelcomepageController());

  WelcomepageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: SingleChildScrollView(
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
                  Column(
                    children: [
                      ElevatedButtonTheme(
                        data: ElevatedButtonThemeData(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: borderLgCircular,
                            ),
                            minimumSize: Size(320, 50),
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            controller.nextContent();
                          },
                          child: Text("Lanjut", style: regularWhite),
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButtonTheme(
                        data: ElevatedButtonThemeData(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: backgroundColor2,
                            shape: RoundedRectangleBorder(
                              borderRadius: borderLgCircular,
                            ),
                            minimumSize: Size(320, 50),
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed("/login");
                          },
                          child: Text("Masuk", style: regularWhite),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
          Text(map["title"], style: sizeXXL),
          Text(map["description"]),
        ],
      ),
    );
  }
}
