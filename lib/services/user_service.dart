import 'package:dio/dio.dart';
import 'dio_client.dart';
import 'package:newcity/models/user.dart';

class UserService {
  static final Dio dio = DioClient.instance;

  static Future<NotifikasiPagination?> getNotifikasi(int page) async {
    try {
      final response =
          await dio.get('api/notification', queryParameters: {'page': page});
      return response.statusCode == 200
          ? NotifikasiPagination.fromJson(response.data)
          : null;
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
