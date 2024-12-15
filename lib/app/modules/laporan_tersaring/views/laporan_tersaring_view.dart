import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/laporan_tersaring_controller.dart';

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

class LaporanTersaringView extends GetView<LaporanTersaringController> {
  const LaporanTersaringView({super.key});

  @override
  Widget build(BuildContext context) {
    final status = Get.arguments as String;
    // Filter data sesuai status 'Menunggu'
    controller.filterByStatus(status);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Laporan $status",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  border: Border.all(color: Color.fromRGBO(88, 129, 87, 1)),
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
                            child: Icon(Icons.search,
                                color: Color.fromRGBO(88, 129, 87, 1)),
                          ),
                          Text(
                            'Cari Laporan',
                            style: TextStyle(
                              color: Color.fromRGBO(88, 129, 87, 1),
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                            ),
                          )
                        ],
                      ),
                      Icon(Icons.filter_list,
                          color: Color.fromRGBO(88, 129, 87, 1)),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.filteredList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          '/detail-laporan',
                        );
                      },
                      child: Column(
                        children: [
                          ReportFrame(data: controller.filteredList[index]),
                          SizedBox(height: 10),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
