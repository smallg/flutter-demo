import 'package:dio/dio.dart';
import 'package:flutter_application_1/http/interceptor/cookie_interceptor.dart';
import 'http_method.dart';
import 'interceptor/print_log_interceptor.dart';
import 'interceptor/rsp_interceptor.dart';

class DioInstance {
  static DioInstance? _instance;

  DioInstance._();

  static DioInstance instance() {
    return _instance ??= DioInstance._();
  }

  final Dio _dio = Dio();
  final _defaultTimeout = const Duration(seconds: 30);
  var _inited = false;

  void initDio({
    required String baseUrl,
    String? httpMethod = HttpMethod.GET,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
    ResponseType? responseType = ResponseType.json,
    String? contentType,
  }) {
    _dio.options = BaseOptions(
      method: httpMethod,
      baseUrl: baseUrl,
      connectTimeout: connectTimeout ?? _defaultTimeout,
      receiveTimeout: receiveTimeout ?? _defaultTimeout,
      sendTimeout: sendTimeout ?? _defaultTimeout,
      responseType: responseType,
      contentType: contentType,
    );
    _dio.interceptors.add(CookieInterceptor());
    _dio.interceptors.add(PrintLogInterceptor());
    _dio.interceptors.add(RspInterceptor());
    _inited = true;
  }

  Future<Response> get({
    required String path,
    Map<String, dynamic>? param,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    if (!_inited) {
      throw Exception("you should call initDio() first!");
    }
    return await _dio.get(path,
        queryParameters: param,
        options: options ??
            Options(
              method: HttpMethod.GET,
              receiveTimeout: _defaultTimeout,
              sendTimeout: _defaultTimeout,
            ),
        cancelToken: cancelToken);
  }

  Future<Response> post(
      {required String path,
      Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken}) async {
    if (!_inited) {
      throw Exception("you should call initDio() first!");
    }
    return await _dio.post(path,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options ??
            Options(
              method: HttpMethod.POST,
              receiveTimeout: _defaultTimeout,
              sendTimeout: _defaultTimeout,
            ));
  }

  BaseOptions buildBaseOptions({
    required String baseUrl,
    String? method = HttpMethod.GET,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
    ResponseType? responseType = ResponseType.json,
    String? contentType,
  }) {
    return BaseOptions(
        method: method,
        baseUrl: baseUrl,
        connectTimeout: connectTimeout ?? _defaultTimeout,
        receiveTimeout: receiveTimeout ?? _defaultTimeout,
        sendTimeout: sendTimeout ?? _defaultTimeout,
        responseType: responseType,
        contentType: contentType);
  }

  void changeBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
  }
}
