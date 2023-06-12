import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio();
  }

  static Future<Response?> get({required String url}) async
  {
    return await dio?.get(url);
  }
}
