import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_training/network/api_constant.dart';
import 'package:flutter_training/network/exception_handler.dart';

class HttpImpl {
  final String baseUrl;
  final Duration connectTimeout;
  final Duration receiveTimeout;
  final Map<String, String> headers;
  final http.Client _client;

  HttpImpl({
    String? baseUrl,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Map<String, String>? headers,
  }) : baseUrl = baseUrl ?? ApiConstant.movieUrl,
        connectTimeout = connectTimeout ?? Duration(seconds: 10),
        receiveTimeout = receiveTimeout ?? Duration(seconds: 10),
        headers = headers ?? {'Content-Type': 'application/json'},
        _client = http.Client();

  Future<dynamic> get(String url, {Map<String, dynamic>? query}) async {
    try {
      final uri = Uri.parse('$baseUrl$url').replace(queryParameters: query);

      print('Request: GET $uri');
      print('Headers: $headers');

      final response = await _client.get(
        uri,
        headers: headers,
      ).timeout(receiveTimeout);

      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return json.decode(response.body);
      } else {
        throw HttpException(
          'HTTP ${response.statusCode}',
          uri: uri,
        );
      }
    } on SocketException catch (e) {
      final errorMessage = ExceptionHandler.handleHttpError(e);
      ExceptionHandler.showErrorSnackBar(errorMessage);
      rethrow;
    } on HttpException catch (e) {
      final errorMessage = ExceptionHandler.handleHttpError(e);
      ExceptionHandler.showErrorSnackBar(errorMessage);
      rethrow;
    } on FormatException catch (e) {
      final errorMessage = ExceptionHandler.handleSyntaxError(e);
      ExceptionHandler.showErrorSnackBar(errorMessage);
      rethrow;
    } catch (e) {
      final errorMessage = ExceptionHandler.handleHttpError(e);
      ExceptionHandler.showErrorSnackBar(errorMessage);
      rethrow;
    }
  }

  void addHeaders(Map<String, String> newHeaders) {
    headers.addAll(newHeaders);
  }

  void dispose() {
    _client.close();
  }
}