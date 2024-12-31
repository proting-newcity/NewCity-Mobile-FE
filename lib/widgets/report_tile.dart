import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newcity/models/report.dart';
import 'package:newcity/api.dart';

Widget ReportTile(Report report) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 10),
    child: GestureDetector(
      onTap: () {
        Get.toNamed('/detail-laporan', arguments: report.id);
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromRGBO(236, 235, 230, 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              report.judul,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 5),
            Text(
              DateFormat('EEEE, d MMMM y - kk:mm').format(report.updatedAt),
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
                        report.deskripsi,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 5),
                      // Row(
                      //   children: [
                      //     Icon(Icons.person_pin_circle_outlined,
                      //         color: Color.fromRGBO(88, 129, 87, 1)),
                      //     Text(
                      //       report.status[0],
                      //       overflow: TextOverflow.ellipsis,
                      //       maxLines: 2,
                      //       style: TextStyle(fontSize: 12),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined,
                              color: Color.fromRGBO(88, 129, 87, 1)),
                          Expanded(
                            child: Text(
                              report.lokasi,
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
                    height: 120,
                    decoration: BoxDecoration(
                      color: getColor(
                          report.status[report.status.length - 1].status),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Column(
                      children: [
                        FutureBuilder<ImageProvider<Object>>(
                          future: ApiService.loadImage(report.foto),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Expanded(
                                child: SizedBox(
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Expanded(
                                child: SizedBox(
                                  child: Icon(Icons.error, color: Colors.red),
                                ),
                              );
                            } else {
                              return Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: snapshot.data!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            report.status[report.status.length - 1].status,
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
      ),
    ),
  );
}

Color getColor(String status) {
  if (status == "Tindak Lanjut") {
    return Color.fromRGBO(171, 192, 171, 1);
  } else if (status == "Selesai") {
    return Color.fromRGBO(58, 90, 64, 1);
  } else if (status == "Dalam Proses") {
    return Color.fromRGBO(250, 178, 45, 1);
  } else {
    return Color.fromRGBO(102, 102, 102, 1);
  }
}
