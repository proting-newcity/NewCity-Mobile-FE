import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/detail_laporan_controller.dart';

class DetailLaporanView extends GetView<DetailLaporanController> {
  DetailLaporanView({super.key});

  final List<Map<String, String>> reports = [
    {
      'title': 'Pengaduan Mengenai Jalanan Berlubang di Cipagalo!',
      'date': 'Senin, 21 Okt 2024 15:00 WIB',
      'author': 'Anonymous',
      'status': 'Selesai',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  // Placeholder image
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3),
                      BlendMode.colorBurn,
                    ),
                    child: Container(
                      height: 225,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(88, 129, 87, 1),
                      ),
                    ),
                  ),
                  // Text content over the image
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 16,
                    top: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back, color: Colors.white),
                              onPressed: () => Get.back(),
                            ),
                            Expanded(
                              child: Text(
                                reports[0]['title']!,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.only(left: 48.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                reports[0]['date']!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  const Icon(Icons.person, color: Colors.white),
                                  const SizedBox(width: 4),
                                  Text(
                                    reports[0]['author']!,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      reports[0]['status'] = 'Selesai';
                                    },
                                    child: Text(reports[0]['status']!),
                                    style: ElevatedButton.styleFrom(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              buildReportDetails(context),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi buat ngehandle icon2
  Widget buildReportDetails(BuildContext context) {
    int likes = 88;
    bool isLiked = false;
    bool isBookmarked = false;

    // Function to toggle like
    void toggleLike() {
      if (isLiked) {
        likes--;
      } else {
        likes++;
      }
      isLiked = !isLiked;
    }

    // Function to toggle bookmark
    void toggleBookmark() {
      isBookmarked = !isBookmarked;
    }

    // Function to show comments
    void showComments() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Comments"),
            content: Text("Comments section goes here."),
            actions: [
              TextButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    // Function to show share options
    void showShareOptions() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Share"),
            content: Text("Share to social media options."),
            actions: [
              TextButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category
          Text(
            'Kategori',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 4),
          Text('Infrastruktur',
              style: TextStyle(fontSize: 14, color: Colors.grey[700])),
          SizedBox(height: 16),

          // Location
          Text(
            'Lokasi',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Jalan Sumbawa, Kota Bandung, Jawa Barat',
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
          ),
          SizedBox(height: 16),

          // Report details
          Text(
            'Detail Laporan',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 16),

          // Icon Row
          Row(
            children: [
              // Like icon with counter
              IconButton(
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  toggleLike();
                  // Rebuild UI to reflect the state change
                  (context as Element).markNeedsBuild();
                },
              ),
              Text(likes.toString()),

              SizedBox(width: 16),

              // Comment icon
              IconButton(
                icon: Icon(Icons.comment, color: Colors.grey),
                onPressed: showComments,
              ),
              Text("3"),

              SizedBox(width: 16),

              // Share icon
              IconButton(
                icon: Icon(Icons.share, color: Colors.grey),
                onPressed: showShareOptions,
              ),

              Text("10"),

              Spacer(),
              // Bookmark icon
              IconButton(
                icon: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: isBookmarked ? Colors.blue : Colors.grey,
                ),
                onPressed: () {
                  toggleBookmark();
                  // Rebuild UI to reflect the state change
                  (context as Element).markNeedsBuild();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
