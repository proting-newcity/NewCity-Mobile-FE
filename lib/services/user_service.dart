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

  static Future<User?> getMasyarakat() async {
    try {
      final response =
          await dio.get('api/user');
      return response.statusCode == 200
          ? User.fromJson(response.data)
          : null;
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  static Future<dynamic> postProfile(String name, String username, String phone) async {
    try{
      final response = await dio.post(
      'api/user',
      data: {
        'name': name,
        'username': username,
        'phone': phone
      }
    );
    return response;

    } catch (e){
      print('Error: $e');
    }
  }
}
