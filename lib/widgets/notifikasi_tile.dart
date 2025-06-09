import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newcity/models/user.dart';
import 'package:newcity/services/image_service.dart';
import 'package:newcity/utils/date.dart';
import 'package:newcity/themes/size_box.dart';

Widget NotifikasiTile(Notifikasi notif) {
  return GestureDetector(
    onTap: () {
      Get.toNamed('/detail-laporan', arguments: notif.idReport);
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder<ImageProvider>(
            future: ImageService.loadThumbnail(notif.fotoProfile ?? ''),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey[200],
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                );
              } else if (snapshot.hasError || notif.fotoProfile == null) {
                return CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/placeholder.png'),
                );
              } else {
                return CircleAvatar(
                  radius: 25,
                  backgroundImage: snapshot.data,
                );
              }
            },
          ),
          sBoxw10,
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          children: [
                            TextSpan(
                              text: "${notif.name} ",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                                text: notif.type == "like"
                                    ? "menyukai laporan anda"
                                    : "berkomentar : ${notif.content}"),
                          ],
                        ),
                      ),
                      sBoxh5,
                      Text(
                        formatTimeAgo(notif.tanggal),
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                    ],
                  ),
                ),
                sBoxw10,
                if (notif.foto.isNotEmpty)
                  FutureBuilder<ImageProvider>(
                    future: ImageService.loadThumbnail(notif.foto),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[300],
                          ),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      } else if (snapshot.hasError) {
                        return Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[300],
                          ),
                          child: const Icon(Icons.error, color: Colors.red),
                        );
                      } else {
                        return Container(
                          width: 60,
                          height: 60,
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
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
