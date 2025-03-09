import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class DioClient {
  static final GetStorage storage = GetStorage();
  static Dio? _dio;

  static Dio get instance {
    _dio ??= _createDio();
    return _dio!;
  }

  static Dio _createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: "https://api.alvanm.my.id/",
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    ));

    dio.options.headers = {
      'Connection': 'Keep-Alive',
      'Keep-Alive': 'timeout=5, max=1000',
      'Accept': 'application/json',
    };

    _setAuthToken(dio);
    return dio;
  }

  static void _setAuthToken(Dio dio) {
    String? token = storage.read('access_token');
    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
  }

  static Future<void> saveAccessToken(String token) async {
    await storage.write('access_token', token);
    instance.options.headers['Authorization'] = 'Bearer $token';
  }

  static Future<void> clearAccessToken() async {
    await storage.remove('access_token');
    instance.options.headers.remove('Authorization');
  }
}
