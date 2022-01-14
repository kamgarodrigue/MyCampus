import 'package:dio/dio.dart';

var baseurl = "http://192.168.43.45:5000/api/";
Dio dio() {
  Dio dio = new Dio();
  dio.options.baseUrl = "http://192.168.43.45:5000/api/";
  dio.options.headers['content-Type'] = 'application/json';
  return dio;
}
