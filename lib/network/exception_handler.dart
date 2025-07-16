import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/main.dart';

import '../ui/widget/base_text_label.dart';

class ExceptionHandler {
  static bool _isShowingSnackBar = false;

  static String handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return "Kết nối quá lâu, vui lòng thử lại";
      case DioExceptionType.receiveTimeout:
        return "Nhận dữ liệu quá lâu, vui lòng thử lại";
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        switch (statusCode) {
          case 400:
            return "Yêu cầu không hợp lệ";
          case 401:
            return "Không có quyền truy cập";
          case 403:
            return "Bị cấm truy cập";
          case 404:
            return "Không tìm thấy dữ liệu";
          case 500:
            return "Lỗi máy chủ nội bộ";
          case 502:
            return "Lỗi gateway";
          case 503:
            return "Dịch vụ không khả dụng";
          default:
            return "Lỗi server: $statusCode";
        }
      case DioExceptionType.connectionError:
        return "Không có kết nối mạng, vui lòng kiểm tra lại";
      case DioExceptionType.cancel:
        return "Yêu cầu bị hủy";
      case DioExceptionType.sendTimeout:
        return "Gửi dữ liệu quá lâu";
      case DioExceptionType.badCertificate:
        return "Chứng chỉ SSL không hợp lệ";
      default:
        return "Lỗi không xác định: ${e.message}";
    }
  }

  static String handleSyntaxError(dynamic error) {
    if (error is FormatException) {
      return "Dữ liệu không hợp lệ: ${error.message}";
    } else if (error is TypeError) {
      return "Lỗi xử lý dữ liệu: Kiểu dữ liệu không đúng";
    } else if (error is NoSuchMethodError) {
      return "Lỗi xử lý: Method không tồn tại";
    } else if (error is RangeError) {
      return "Lỗi truy cập dữ liệu: ${error.message ?? 'Index vượt quá giới hạn'}";
    } else if (error is ArgumentError) {
      return "Tham số không hợp lệ: ${error.message}";
    } else if (error is StateError) {
      return "Lỗi trạng thái: ${error.message}";
    } else if (error is UnsupportedError) {
      return "Chức năng không được hỗ trợ: ${error.message}";
    } else if (error is UnimplementedError) {
      return "Chức năng chưa được triển khai";
    } else if (error is AssertionError) {
      return "Lỗi logic: ${error.message}";
    } else {
      return "Lỗi không xác định: ${error.toString()}";
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