import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:newcity/models/berita.dart';
import 'package:newcity/models/report.dart';
import 'package:retry/retry.dart';
import 'package:newcity/models/user.dart';
import 'package:get_storage/get_storage.dart';

class ApiService extends GetConnect {
  static Dio dio = createDio();
  static final GetStorage storage = GetStorage();

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: "http://10.0.2.2:8000/",
      connectTimeout: Duration(seconds: 15),
      receiveTimeout: Duration(seconds: 30),
    ));
    dio.options.headers = {
      'Connection': 'Keep-Alive',
      'Keep-Alive': 'timeout=5, max=1000',
    };

    String? token = storage.read('access_token');
    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }

    return dio;
  }

  static Future<void> saveAccessToken(String token) async {
    await storage.write('access_token', token);
  }

  static Future<dynamic> login(String username, String password) async {
    try {
      final response = await dio.post(
        'api/login',
        data: {
          'username': username,
          'password': password,
          'role': 'pemerintah',
          "always_signed_in": true
        },
      );

      if (response.statusCode == 200) {
        final token = response.data['access_token'];
        if (token != null) {
          await saveAccessToken(token);
          dio.options.headers['Authorization'] = 'Bearer $token';
        }
      } else {
        print("Login failed: ${response.data}");
      }
      return response;
    } catch (e) {
      print("Error during login: $e");
    }
  }

  static Future<void> logout() async {
    try {
      final response = await dio.post(
        'api/login',
      );
      if (response.statusCode == 200) {
        await storage.remove('access_token');
        dio.options.headers.remove('Authorization');
        print("Logout successful.");
      }
    } catch (e) {
      print("Error during logout: $e");
    }
  }

  static Future<User?> register(
      String name, String username, String password) async {
    try {
      final response = await dio.post(
        'api/register',
        data: {
          'name': name,
          'username': username,
          'password': password,
          'password_confirmation': password,
          'always_signed_in': 1,
          'role': 'masyarakat',
        },
        options: Options(headers: {
          "Accept": "application/json",
        }),
      );
      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        throw Exception('Failed to register');
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  static Future<dynamic> changePassword(String phone, String password) async {
    try {
      final response = await dio.post(
        'api/reset-password',
        data: {
          'username': phone,
          'new_password': password,
        },
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to change password');
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  static Future<dynamic> postReport(var data) async {
    final response = await dio.post(
      'api/report',
      data: data,
      options: Options(headers: {
        "Accept": "application/json",
      }),
    );
    return response;
  }

  static Future<ReportResponsePagination?> getPaginationReport(int page) async {
    try {
      final response = await dio.get(
        'api/report',
        queryParameters: {'page': page},
      );
      if (response.statusCode == 200) {
        return ReportResponsePagination.fromJson(response.data);
      } else {
        throw Exception('Failed to load berita');
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  static Future<ReportResponse?> getReport(int id) async {
    try {
      final response = await dio.get(
        'api/report/$id',
      );
      if (response.statusCode == 200) {
        return ReportResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load berita');
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  static Future<ReportResponsePagination?> getReportByKategori(
      int page, id) async {
    try {
      final response = await dio
          .get('api/report/category/$id', queryParameters: {'page': page});
      if (response.statusCode == 200) {
        return ReportResponsePagination.fromJson(response.data);
      } else {
        throw Exception('Failed to load berita');
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  static Future<ReportResponsePagination?> getReportByStatus(
      int page, status) async {
    try {
      final response = await dio
          .get('api/report/status/$status', queryParameters: {'page': page});
      if (response.statusCode == 200) {
        return ReportResponsePagination.fromJson(response.data);
      } else {
        throw Exception('Failed to load berita');
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  static Future<dynamic> addStatus(int id, String status) async {
    try {
      final response = await dio.post(
        'api/report/status/$id',
        data: {"status": status},
      );
      if (response.statusCode == 200) {
        print('Status added successfully');
        Get.snackbar('Success', 'Status berhasil ditambahkan',
            snackPosition: SnackPosition.BOTTOM);
      } else {
        throw Exception('Failed to add status');
      }
    } catch (e) {
      print('Error menambah status $e');
    }
  }

  static Future<ReportResponsePagination?> getSearchedReport(
      int page, String keyword) async {
    try {
      final response = await dio.get(
        'api/report/search',
        queryParameters: {
          'page': page,
          'search': keyword,
        },
      );
      if (response.statusCode == 200) {
        return ReportResponsePagination.fromJson(response.data);
      } else {
        throw Exception('Failed to load berita');
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  static Future<List<Comment>?> getComments(int id) async {
    try {
      final response = await dio.get(
        'api/report/diskusi/$id',
      );
      if (response.statusCode == 200) {
        return Comment.fromJsonList(response.data);
      } else {
        throw Exception('Failed to load comment');
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  static Future<dynamic> toggleLikeReport(int id) async {
    try {
      final response =
          await dio.post('api/report/like', data: {'id': id, "loaded": false});
      if (response.statusCode == 200) {
        return Comment.fromJsonList(response.data);
      } else {
        throw Exception('Failed to like');
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  static Future<dynamic> postComment(int id, String content) async {
    try {
      final response =
          await dio.post('api/report/diskusi/$id', data: {'content': content});
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to load comment');
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  static Future<BeritaResponsePagination?> getPaginationBerita(int page) async {
    try {
      final response = await dio.get(
        'api/berita',
        queryParameters: {'page': page},
      );
      if (response.statusCode == 200) {
        return BeritaResponsePagination.fromJson(response.data);
      } else {
        throw Exception('Failed to load berita');
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  static Future<BeritaResponsePagination?> getBeritaByKategori(
      int page, id) async {
    try {
      final response = await dio
          .get('api/berita/category/$id', queryParameters: {'page': page});
      if (response.statusCode == 200) {
        return BeritaResponsePagination.fromJson(response.data);
      } else {
        throw Exception('Failed to load berita');
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  static Future<KategoriBeritaResponse?> getKategoriBerita() async {
    try {
      final response = await dio.get('api/kategori/berita');
      if (response.statusCode == 200) {
        return KategoriBeritaResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load kategori');
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  static Future<KategoriReportResponse?> getKategoriReport() async {
    try {
      final response = await dio.get('api/kategori/report');
      if (response.statusCode == 200) {
        return KategoriReportResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load kategori');
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  static Future<ImageProvider<Object>> loadImage(String imagePath) async {
    final r = RetryOptions(maxAttempts: 30, delayFactor: Duration(seconds: 5));
    final baseUrl = dio.options.baseUrl;
    try {
      String fullUrl = "$baseUrl$imagePath";
      return await r.retry(
        () => Dio().get(fullUrl).then((response) {
          return NetworkImage(fullUrl);
        }),
        retryIf: (e) => e is DioException && e.type != DioExceptionType.cancel,
      );
    } catch (e) {
      print("Error loading image: $e");
      return AssetImage('assets/placeholder.png');
    }
  }

  static Future<dynamic> getMasyarakatByPhone(String phone) async {
    try {
      final response = await dio.get('api/masyarakat/search?search=$phone');
      if (response.statusCode == 200) {
        return response;
      } else {
        return response;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
