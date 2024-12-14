import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newcity/models/report.dart';
import 'package:newcity/api.dart';

Widget reportCard(Report report) {
  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          FutureBuilder<ImageProvider<Object>>(
            future: ApiService.loadImage(report.foto),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[300],
                  ),
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (snapshot.hasError) {
                return Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[300],
                  ),
                  child: Icon(Icons.error, color: Colors.red),
                );
              } else {
                return Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: snapshot.data!,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }
            },
          ),
          SizedBox(width: 16), // Spacer between image and text

          // Text section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  report
                      .judul, // Display the 'judul' field from the Report model
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  DateFormat('yyyy-MM-dd – kk:mm').format(report.updatedAt),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),

          // Circle Avatar for a generic icon, you can modify it as needed
          CircleAvatar(
            backgroundColor: Color.fromRGBO(88, 129, 87, 1),
            radius: 40,
            child: Icon(
              Icons.article,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    ),
  );
}
