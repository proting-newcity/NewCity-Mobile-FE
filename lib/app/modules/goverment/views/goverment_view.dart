import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/goverment_controller.dart';

class ReportFrame extends StatelessWidget {
  final Map<String, dynamic> data;

  const ReportFrame({Key? key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(236, 235, 230, 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data['title'] ?? 'No title available',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          ),
          SizedBox(height: 5),
          Text(
            data['date'] ?? 'No date available',
            style: TextStyle(
                color: Color.fromRGBO(102, 102, 102, 1), fontSize: 11),
          ),
          SizedBox(height: 5),
          Divider(
            height: 0.5,
            color: Colors.black,
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['description'] ?? 'No description available',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.person_pin_circle_outlined,
                            color: Color.fromRGBO(88, 129, 87, 1)),
                        Text(
                          data['author'] ?? 'Anonymous',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,
                            color: Color.fromRGBO(88, 129, 87, 1)),
                        Expanded(
                          child: Text(
                            data['location'] ?? 'No location available',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: data['color'],
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)),
                        child: Image.asset(
                          data['imagePath'] ?? "assets/images/default.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          data['status'] ?? 'No status',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class GovermentView extends GetView<GovermentController> {
  const GovermentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 30, top: 55, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 13),
                  child: Image.asset(
                    "assets/images/logo_NewCity_Original.png",
                    height: 50,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selamat datang!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(58, 90, 64, 1),
                          fontFamily: 'Poppins',
                          fontSize: 26,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'Selasa, 22 Oktober 2024',
                      style: TextStyle(
                          color: Color.fromRGBO(129, 125, 125, 1),
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                  // color: Color.fromRGBO(249, 249, 249, 1),
                  border: Border.all(
                    color: Color.fromRGBO(88, 129, 87, 1),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Icon(
                              Icons.search,
                              color: Color.fromRGBO(88, 129, 87, 1),
                            ),
                          ),
                          Text(
                            'Cari Laporan',
                            style: TextStyle(
                                color: Color.fromRGBO(88, 129, 87, 1),
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontStyle: FontStyle.italic),
                          )
                        ],
                      ),
                      Icon(
                        Icons.filter_list,
                        color: Color.fromRGBO(88, 129, 87, 1),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: 280,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundColor: Color.fromRGBO(88, 129, 87, 1),
                          child: Icon(
                            Icons.file_copy,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Laporan',
                          style: TextStyle(
                            color: Color.fromRGBO(88, 129, 87, 1),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundColor: Color.fromRGBO(88, 129, 87, 1),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Konfirmasi',
                          style: TextStyle(
                            color: Color.fromRGBO(88, 129, 87, 1),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundColor: Color.fromRGBO(88, 129, 87, 1),
                          child: Icon(
                            Icons.person_outlined,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Profil',
                          style: TextStyle(
                            color: Color.fromRGBO(88, 129, 87, 1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Rekomendasi Untukmu',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: GovermentController.listMap.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ReportFrame(
                        data: GovermentController.listMap[index],
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
