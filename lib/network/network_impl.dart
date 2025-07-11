import 'package:dio/dio.dart';
import 'package:flutter_training/network/api_constant.dart';
import 'package:flutter_training/network/exception_handler.dart';

class NetworkImpl {
  final Dio _dio;
  final String baseUrl;

  NetworkImpl({
    String? baseUrl,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Map<String, dynamic>? headers,
  }) : baseUrl = baseUrl ?? ApiConstant.movieUrl,
        _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl ?? ApiConstant.movieUrl,
            connectTimeout: connectTimeout ?? Duration(seconds: 10),
            receiveTimeout: receiveTimeout ?? Duration(seconds: 10),
            headers: headers ?? {'Content-Type': 'application/json'},
          ),
        ) {
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      logPrint: (log) => print(log),
    ));
  }

  Future<dynamic> get(String url, {Map<String, dynamic>? query}) async {
    try {
      final response = await _dio.get(url, queryParameters: query);
      return response.data;
    } on DioException catch (e) {
      final errorMessage = ExceptionHandler.handleDioError(e);
      ExceptionHandler.showErrorSnackBar('$errorMessage');
      rethrow;
    }
  }

  void customUrl(String newUrl) {
    _dio.options.baseUrl = newUrl;
  }

  void addHeaders(Map<String, dynamic> headers) {
    _dio.options.headers.addAll(headers);
  }

  void addInterceptor(Interceptor interceptor) {
    _dio.interceptors.add(interceptor);
  }
}