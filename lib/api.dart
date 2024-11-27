import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/connect.dart';
import 'package:newcity/model.dart';

class ApiService extends GetConnect {
  static Dio dio = createDio();
  static String _token = "";
  static String _apiKey = "";

  ApiService() {
    dio.options.baseUrl = "http://10.0.2.2:8000";
  }

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: "http://10.0.2.2:8000/", //For example : https:www.example.com
    ));
    return dio;
  }

  static Future<dynamic> postReport(var data) async {
    final response = await dio.post(
      'api/report',
      data: data,
      options: Options(headers: {
        "Accept": "application/json",
      }),
    );

    // Check response status code
    return response;
  }

  static Future<BeritaResponse?> getPaginationBerita() async {
    try {
      final response = await dio.get('api/berita');
      if (response.statusCode == 200) {
        return BeritaResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load berita');
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  static Future<KategoriBeritaResponse?> getKategori() async {
    try {
      final response = await dio.get('api/kategori/berita');
      if (response.statusCode == 200) {
        return KategoriBeritaResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load berita');
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  static ImageProvider<Object> loadImage(String url) {
    String baseUrl = dio.options.baseUrl;
    return NetworkImage("$baseUrl$url");
  }
}
