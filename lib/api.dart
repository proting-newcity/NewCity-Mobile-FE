import 'package:dio/dio.dart';

class ApiService {
  late Dio dio = createDio();
  String _token = "";
  String _apiKey = "";

  ApiService() {
    dio.options.baseUrl = "http://10.0.2.2:8000";
  }

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: "http://10.0.2.2:8000", //For example : https:www.example.com
    ));
    return dio;
  }

  Future<dynamic> postReport(var data) async {
    final response = await dio.post(
      '/api/report',
      data: data,
      options: Options(headers: {
        "Accept": "application/json",
      }),
    );

    // Check response status code
    return response;
  }
}
