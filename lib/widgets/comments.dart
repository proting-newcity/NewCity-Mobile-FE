import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newcity/app/modules/detail_laporan/controllers/detail_laporan_controller.dart';
import 'package:newcity/models/report.dart';
import 'package:newcity/services/image_service.dart';
import 'package:newcity/services/report_service.dart';
import 'package:newcity/utils/date.dart';

Widget ShowComment(
    BuildContext context, int? id, TextEditingController contentController) {
  final MediaQueryData mediaQueryData = MediaQuery.of(context);
  final DetailLaporanController controller = Get.find();
  return FutureBuilder<List<Comment>?>(
    future: ReportService.getComments(id!),
    builder: (context, snapshot) {
      // error handling
      if (snapshot.hasError) {
        return Center(child: const Text('Error loading comments'));
      }

      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 16.0,
              bottom: mediaQueryData.viewInsets.bottom + 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Diskusi",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.close),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // comment empty
              if (snapshot.data == null || snapshot.data!.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: const Text(
                    'No comments available.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),

              // load comment
              if (snapshot.hasData && snapshot.data!.isNotEmpty)
                ...snapshot.data!.map((comment) {
                  return CommentTile(
                    username: comment.name,
                    time: DateTime.parse(comment.tanggal),
                    comment: comment.content,
                    foto: comment.foto,
                  );
                }).toList(),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: contentController,
                      decoration: InputDecoration(
                        hintText: "Tulis diskusimu..",
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    icon: Icon(Icons.send, color: Colors.green),
                    onPressed: () {
                      controller.addComment(contentController.text);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget CommentTile({
  required String username,
  required DateTime time,
  required String comment,
  required String foto,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            FutureBuilder<ImageProvider>(
              future: ImageService.loadImage(foto),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.grey[200],
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage('assets/placeholder.png'),
                  );
                } else {
                  return CircleAvatar(
                    radius: 16,
                    backgroundImage: snapshot.data,
                  );
                }
              },
            ),
            SizedBox(width: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  username,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Text(
                  convertToAgo(time),
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 41.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(comment),
            ],
          ),
        ),
      ],
    ),
  );
}
