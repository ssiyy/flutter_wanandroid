import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:wanandroid/data/base_bean.dart';

class HttpService {
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

  ///单例模式的一种写法，来自于：https://stackoverflow.com/questions/54057958/comparing-ways-to-create-singletons-in-dart
  static final HttpService instance = HttpService._privateConstructor();

  /// 网络请求的get方法
  ///
  /// [url]表示网络请求的地址
  ///
  /// [params]网络请求的参数
  ///
  /// [fromJson]对请求返回的结果进行转换，不传采用默认的实现，默认实现是转成[BaseBean]
  Future<T> get<T>(String url,
      {Map<String, dynamic> params,
      T fromJson(BaseBean result)}) async {
    return _request(url, Options(method: "GET"),
        params: params, fromJson: fromJson);
  }

  /// 网络请求的get方法
  ///
  /// [url]表示网络请求的地址
  ///
  /// [params]网络请求的参数
  ///
  /// [fromJson]对请求返回的结果进行转换，不传采用默认的实现，默认实现是转成[BaseBean]
  Future<T> post<T>(String url,
      {Map<String, dynamic> params,
      T fromJson(BaseBean result)}) async {
    return _request(url, Options(method: "POST"),
        params: params, fromJson: fromJson);
  }

  /// 网络请求的方法
  ///
  /// [url]表示网络请求的地址
  ///
  /// [options] 网络请求的选项[Options]
  ///
  /// [params]网络请求的参数
  ///
  /// [fromJson]对请求返回的结果进行转换，不传采用默认的实现，默认实现是转成[_request]返回的类型
  Future<T> _request<T>(String url, Options options,
      {Map<String, dynamic> params,
      T fromJson(BaseBean result)}) async {
    if (fromJson == null) {
      fromJson = (result) {
        return result as T;
      };
    }
    try {
      var response =
          await _dio.request(url, queryParameters: params, options: options);
      if (response.statusCode == HttpStatus.ok) {
        var data = jsonDecode(response.toString());

        var baseBean = BaseBean.fromJson(data);
        if (baseBean.isSuccess) {
          return fromJson(baseBean);
        } else {
          throw baseBean;
        }
      } else {
        throw Exception("http reponse error");
      }
    } catch (e) {
      //打印一下错误的消息
      print(e.toString());
      //允许调用继续获得这个错误
      rethrow;
    }
  }
}
