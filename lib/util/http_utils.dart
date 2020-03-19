import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:wanandroid/data/base_bean.dart';

class HttpService {
  ///单例模式的一种写法，来自于：https://stackoverflow.com/questions/54057958/comparing-ways-to-create-singletons-in-dart
  HttpService._privateConstructor() {
    _dio = Dio()
      ..options = BaseOptions(
        baseUrl: "https://www.wanandroid.com/",
        connectTimeout: 30000,
        receiveTimeout: 30000,
      )
      ..interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          compact: false));
  }

  Dio _dio;

  static final HttpService instance = HttpService._privateConstructor();

  Future<T> get<T>(String url,
      {Map<String, dynamic> params,
      T fromJson(Map<String, dynamic> json)}) async {
    return _request(url, Options(method: "GET"),
        params: params, fromJson: fromJson);
  }

  Future<T> post<T>(String url,
      {Map<String, dynamic> params,
      T fromJson(Map<String, dynamic> json)}) async {
    return _request(url, Options(method: "POST"),
        params: params, fromJson: fromJson);
  }

  Future<T> _request<T>(String url, Options options,
      {Map<String, dynamic> params,
      T fromJson(Map<String, dynamic> json)}) async {
    if (fromJson == null) {
      fromJson = (value) {
        return value as T;
      };
    }
    var response =
        await _dio.request(url, queryParameters: params, options: options);
    if (response.statusCode == HttpStatus.ok) {
      var data = jsonDecode(response.toString());
      print(data);
      var baseBean = BaseBean.fromJson(data);
      if (baseBean.isSuccess) {
        return fromJson(baseBean.data);
      } else {
        throw baseBean;
      }
    } else {
      throw Exception("http reponse error");
    }
  }
}
