import 'package:dio/dio.dart';

class DioConfig {
  static Dio createReq() {
    var dio = new Dio(BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com",
      validateStatus: (int? statusCode) {
        if (statusCode != null) {
          if (statusCode >= 100 && statusCode <= 511) {
            return true;
          } else {
            return false;
          }
        } else {
          return false;
        }
      },
      receiveDataWhenStatusError: true,
    ));

    dio.options.connectTimeout = Duration(seconds: 55);
    dio.options.receiveTimeout = Duration(seconds: 55);
    dio.options.sendTimeout = Duration(seconds: 55);
    dio.options.headers['content-Type'] = 'application/x-www-form-urlencoded';
    return dio;
  }
}
