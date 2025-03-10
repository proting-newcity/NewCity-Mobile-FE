import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retry/retry.dart';
import 'dio_client.dart';

class ImageService {
  static final Dio dio = DioClient.instance;

  static Future<ImageProvider<Object>> loadImage(String imagePath) async {
    final r =
        RetryOptions(maxAttempts: 3, delayFactor: const Duration(seconds: 3));
    final baseUrl = dio.options.baseUrl;
    String fullUrl = "$baseUrl$imagePath";

    try {
      return await r.retry(() async {
        await dio.get(fullUrl);
        return NetworkImage(fullUrl);
      });
    } catch (e) {
      print("Error loading image: $e");
      return const AssetImage('assets/placeholder.png');
    }
  }

  static Future<ImageProvider<Object>> loadThumbnail(String imagePath) async {
    final parts = imagePath.split('/');

    if (parts.length < 3 || parts[0] != 'storage') {
      print("Invalid image path: $imagePath");
      return const AssetImage('assets/placeholder.png');
    }

    parts.insert(3, 'thumbnail');

    final thumbnailPath = parts.join('/');

    return await loadImage(thumbnailPath);
  }
}
