import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newcity/models/report.dart';
import 'package:newcity/themes/size_box.dart';

Widget DetailStatus(Status status) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        children: [
          Container(
            height: 23,
            width: 23,
            decoration: BoxDecoration(
              border: Border.all(color: getColor(status.status), width: 2),
              shape: BoxShape.circle,
            ),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: getColor(status.status),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Container(
            height: 65,
            width: 2,
            color: Colors.grey[300],
          ),
        ],
      ),
      sBoxw10,
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              status.status,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            sBoxh4,
            Text(
              status.deskripsi,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
            sBoxh4,
            Text(
              DateFormat('yyyy-MM-dd – kk:mm').format(status.tanggal),
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    ],
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
