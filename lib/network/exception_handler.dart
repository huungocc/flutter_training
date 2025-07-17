import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/main.dart';
import 'package:flutter_training/util/localization_service.dart';
import 'package:flutter_training/ui/widget/base_text_label.dart';


class ExceptionHandler {
  static bool _isShowingSnackBar = false;

  static String handleDioError(DioException e) {
    final loc = LocalizationService.current;
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return loc.error_connection_timeout;
      case DioExceptionType.receiveTimeout:
        return loc.error_receive_timeout;
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        switch (statusCode) {
          case 400:
            return loc.error_400;
          case 401:
            return loc.error_401;
          case 403:
            return loc.error_403;
          case 404:
            return loc.error_404;
          case 500:
            return loc.error_500;
          case 502:
            return loc.error_502;
          case 503:
            return loc.error_503;
          default:
            return loc.error_unknown_server(statusCode.toString());
        }
      case DioExceptionType.connectionError:
        return loc.error_no_connection;
      case DioExceptionType.cancel:
        return loc.error_canceled;
      case DioExceptionType.sendTimeout:
        return loc.error_send_timeout;
      case DioExceptionType.badCertificate:
        return loc.error_bad_certificate;
      default:
        return loc.error_unknown(e.message ?? '');
    }
  }

  static String handleSyntaxError(dynamic error) {
    final loc = LocalizationService.current;
    if (error is FormatException) {
      return loc.syntax_error_format(error.message);
    } else if (error is TypeError) {
      return loc.syntax_error_type;
    } else if (error is NoSuchMethodError) {
      return loc.syntax_error_no_method;
    } else if (error is RangeError) {
      return loc.syntax_error_range(error.message ?? '');
    } else if (error is ArgumentError) {
      return loc.syntax_error_argument(error.message ?? '');
    } else if (error is StateError) {
      return loc.syntax_error_state(error.message);
    } else if (error is UnsupportedError) {
      return loc.syntax_error_unsupported(error.message ?? '');
    } else if (error is UnimplementedError) {
      return loc.syntax_error_unimplemented;
    } else if (error is AssertionError) {
      return loc.syntax_error_assertion(error.message ?? '');
    } else {
      return loc.error_unknown(error.toString());
    }
  }

  static void showSuccessSnackBar(String message) {
    final context = NavigationService.context;
    if (context != null && !_isShowingSnackBar) {
      _isShowingSnackBar = true;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: BaseTextLabel(message),
          backgroundColor: Colors.greenAccent,
          duration: const Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ).closed.then((_) {
        _isShowingSnackBar = false;
      });
    }
  }

  static void showErrorSnackBar(String message) {
    final context = NavigationService.context;
    if (context != null && !_isShowingSnackBar) {
      _isShowingSnackBar = true;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: BaseTextLabel(message),
          backgroundColor: Colors.white,
          duration: const Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ).closed.then((_) {
        _isShowingSnackBar = false;
      });
    }
  }
}