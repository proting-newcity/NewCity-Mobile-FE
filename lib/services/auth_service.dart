import 'package:dio/dio.dart';
import 'dio_client.dart';

class AuthService {
  static final Dio dio = DioClient.instance;

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
          await DioClient.saveAccessToken(token);
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
      await dio.post('api/logout');
      await DioClient.clearAccessToken();
    } catch (e) {
      print("Error during logout: $e");
    }
  }

  static Future<bool> register(
      String name, String username, String password) async {
    try {
      final response = await dio.post('api/register', data: {
        'name': name,
        'username': username,
        'password': password,
        'password_confirmation': password,
        'role': 'masyarakat',
      });

      return response.statusCode == 200;
    } catch (e) {
      print("Error: $e");
      return false;
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
