// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get login => 'Đăng nhập';

  @override
  String get digit_clock => 'Đồng hồ số';

  @override
  String get movie => 'Phim';

  @override
  String get todo => 'Việc cần làm';

  @override
  String get discover_your_dream => 'Khám phá công việc mơ ước của bạn tại đây';

  @override
  String get explorer_all_job =>
      'Khám phá tất cả vai trò công việc hiện có dựa trên sở thích và ngành học của bạn';

  @override
  String get register => 'Đăng ký';

  @override
  String get login_here => 'Đăng nhập tại đây';

  @override
  String get welcome_back => 'Chào mừng bạn quay trở lại!';

  @override
  String get email => 'Email';

  @override
  String get password => 'Mật khẩu';

  @override
  String get forgot_password => 'Quên mật khẩu?';

  @override
  String get sign_in => 'Đăng nhập';

  @override
  String get create_new_account => 'Tạo tài khoản mới';

  @override
  String get create_account => 'Tạo tài khoản';

  @override
  String get create_account_explore =>
      'Tạo tài khoản để bạn có thể khám phá tất cả công việc hiện có';

  @override
  String get confirm_password => 'Xác nhận mật khẩu';

  @override
  String get sign_up => 'Đăng ký';

  @override
  String get already_account => 'Đã có tài khoản';

  @override
  String get or_continue => 'Hoặc tiếp tục với';

  @override
  String get movies => 'Danh sách phim';

  @override
  String get details => 'Chi tiết';

  @override
  String count_minutes(Object count) {
    return '$count phút';
  }

  @override
  String get my_todo_list => 'Việc cần làm';

  @override
  String get add_new_task => 'Thêm công việc mới';

  @override
  String get task_title => 'Tiêu đề công việc';

  @override
  String get category => 'Danh mục';

  @override
  String get date => 'Ngày';

  @override
  String get time => 'Thời gian';

  @override
  String get notes => 'Ghi chú';

  @override
  String get save => 'Lưu';

  @override
  String get loading_movies => 'Đang tải phim...';

  @override
  String get completed => 'Đã hoàn thành';

  @override
  String get edit_task => 'Sửa công việc';

  @override
  String get error_connection_timeout =>
      'Kết nối quá thời gian, vui lòng thử lại';

  @override
  String get error_receive_timeout => 'Nhận dữ liệu quá lâu, vui lòng thử lại';

  @override
  String get error_400 => 'Yêu cầu không hợp lệ';

  @override
  String get error_401 => 'Không có quyền truy cập';

  @override
  String get error_403 => 'Bị từ chối truy cập';

  @override
  String get error_404 => 'Không tìm thấy dữ liệu';

  @override
  String get error_500 => 'Lỗi máy chủ nội bộ';

  @override
  String get error_502 => 'Lỗi gateway';

  @override
  String get error_503 => 'Dịch vụ không khả dụng';

  @override
  String error_unknown_server(Object statusCode) {
    return 'Lỗi máy chủ: $statusCode';
  }

  @override
  String get error_no_connection =>
      'Không có kết nối mạng, vui lòng kiểm tra lại';

  @override
  String get error_canceled => 'Yêu cầu đã bị hủy';

  @override
  String get error_send_timeout => 'Gửi dữ liệu quá thời gian';

  @override
  String get error_bad_certificate => 'Chứng chỉ SSL không hợp lệ';

  @override
  String error_unknown(Object message) {
    return 'Lỗi không xác định: $message';
  }

  @override
  String syntax_error_format(Object message) {
    return 'Dữ liệu không hợp lệ: $message';
  }

  @override
  String get syntax_error_type => 'Lỗi xử lý dữ liệu: Kiểu dữ liệu không đúng';

  @override
  String get syntax_error_no_method => 'Lỗi xử lý: Phương thức không tồn tại';

  @override
  String syntax_error_range(Object message) {
    return 'Lỗi truy cập dữ liệu: $message';
  }

  @override
  String syntax_error_argument(Object message) {
    return 'Tham số không hợp lệ: $message';
  }

  @override
  String syntax_error_state(Object message) {
    return 'Lỗi trạng thái: $message';
  }

  @override
  String syntax_error_unsupported(Object message) {
    return 'Chức năng không được hỗ trợ: $message';
  }

  @override
  String get syntax_error_unimplemented => 'Chức năng chưa được triển khai';

  @override
  String syntax_error_assertion(Object message) {
    return 'Lỗi logic: $message';
  }

  @override
  String get success_operation => 'Thao tác thành công';

  @override
  String get todo_add_success => 'Thêm thành công';

  @override
  String get todo_update_success => 'Cập nhật thành công';

  @override
  String get todo_update_status_success => 'Cập nhật trạng thái thành công';

  @override
  String get todo_delete_success => 'Xoá thành công';

  @override
  String get please_fill_in_all_fields => 'Vui lòng nhập đủ các trường';

  @override
  String get complete_task => 'Hoàn thành công việc này?';

  @override
  String get cancel_complete_task => 'Huỷ hoàn thành công việc này?';

  @override
  String get cancel => 'Huỷ';

  @override
  String get no_data_yet => 'Chưa có dữ liệu';
}
