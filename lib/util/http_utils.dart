import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:wanandroid/data/base_bean.dart';

class HttpService {
  static final RegExp _PATH_TRAVERSAL =
  RegExp("(.*/)?(\\.|%2e|%2E){1,2}(/.*)?");

  // 以字符大小写，数字，下划线和连字符开头。
  static final _PARAM = "[a-zA-Z][a-zA-Z0-9_-]*";
  static final _PARAM_URL_REGEX = RegExp("\\{(" + _PARAM + ")\\}");
  static final _PARAM_NAME_REGEX = RegExp(_PARAM);

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
      Map<String, dynamic> paths,
      T fromJson(BaseBean result)}) async {
    return _request(url, Options(method: "GET"),
        params: params, paths: paths, fromJson: fromJson);
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
      Map<String, dynamic> paths,
      T fromJson(BaseBean result)}) async {
    return _request(url, Options(method: "POST"),
        params: params, paths: paths, fromJson: fromJson);
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
      Map<String, dynamic> paths,
      T fromJson(BaseBean result)}) async {
    //校验一下传入的paths参数
    _validatePathsName(paths?.keys);
    //获取一下path中的参数
    final pathParams = _parsePathParameters(url);
    for (var pathParam in pathParams) {
      //校验一下paths 参数
      _validatePathParamsName(url, pathParam, paths?.keys);
      final pathValue = paths[pathParam];
      //替换掉参数
      url = _addPathParam(url, pathParam, pathValue);
    }

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

  ///校验逻辑：[url]中包含的{param}在paths都必须给出相应的值,所以是以url包含的需要的参数为准
  ///
  ///校验一下path param的参数，方法来自与Retrofit RequestFactory
  ///
  ///[url] 请求的链接地址
  ///
  ///[pathParams] [url]地址中通过[_parsePathParameters]解析获得的包含需要替换值 path 参数
  ///
  ///[name] 替换path参数的名称
  void _validatePathParamsName(
      String url, String pathParams, Iterable<String> paths) {
    //验证一下
    if ((paths?.contains(pathParams) ?? false) == false) {
      throw '''"{$pathParams}" in URL "$url" does not provide value.''';
    }
  }

  ///校验一下paths参数
  void _validatePathsName(Iterable<String> paths){
    for(var path in paths){
      if (!_PARAM_NAME_REGEX.hasMatch(path)) {
        throw '''paths parameter name must match ${_PARAM_URL_REGEX.pattern}. Found: "$path"''';
      }
    }
  }

  /// 解析一下path中的参数,方法来自与Retrofit RequestFactory
  Set<String> _parsePathParameters(String path) {
    final matchers = _PARAM_URL_REGEX.allMatches(path);
    Set<String> patterns = Set<String>();
    matchers.forEach((element) {
      patterns.add(element.group(1));
    });
    return patterns;
  }

  /// 添加path中的参数,方法来自与Retrofit RequestBuilder
  String _addPathParam(String relativeUrl, String name, dynamic value) {
    final newRelativeUrl =
        relativeUrl.replaceFirst("{" + name + "}", value.toString());

    if (_PATH_TRAVERSAL.hasMatch(newRelativeUrl)) {
      throw "parameters shouldn't perform path traversal ('.' or '..'):$value";
    }

    return newRelativeUrl;
  }
}
