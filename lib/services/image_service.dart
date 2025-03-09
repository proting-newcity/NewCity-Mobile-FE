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
}
