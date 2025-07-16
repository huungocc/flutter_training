// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get login => 'Login';

  @override
  String get digit_clock => 'Digit Clock';

  @override
  String get movie => 'Movie';

  @override
  String get todo => 'Todo';

  @override
  String get discover_your_dream => 'Discover Your Dream Job here';

  @override
  String get explorer_all_job =>
      'Explore all the existing job roles based on your interest and study major';

  @override
  String get register => 'Register';

  @override
  String get login_here => 'Login here';

  @override
  String get welcome_back => 'Welcome back you’ve been missed!';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get forgot_password => 'Forgot your password?';

  @override
  String get sign_in => 'Sign in';

  @override
  String get create_new_account => 'Create new account';

  @override
  String get create_account => 'Create Account';

  @override
  String get create_account_explore =>
      'Create an account so you can explore all the existing jobs';

  @override
  String get confirm_password => 'Confirm Password';

  @override
  String get sign_up => 'Sign up';

  @override
  String get already_account => 'Already have an account';

  @override
  String get or_continue => 'Or continue with';

  @override
  String get movies => 'Movies';

  @override
  String get details => 'Details';

  @override
  String count_minutes(Object count) {
    return '$count minutes';
  }

  @override
  String get my_todo_list => 'My Todo List';

  @override
  String get add_new_task => 'Add New Task';

  @override
  String get task_title => 'Task Title';

  @override
  String get category => 'Category';

  @override
  String get date => 'Date';

  @override
  String get time => 'Time';

  @override
  String get notes => 'Notes';

  @override
  String get save => 'Save';

  @override
  String get loading_movies => 'Loading movies...';

  @override
  String get completed => 'Completed';

  @override
  String get edit_task => 'Edit Task';

  @override
  String get error_connection_timeout =>
      'Connection timed out, please try again';

  @override
  String get error_receive_timeout =>
      'Receiving data timed out, please try again';

  @override
  String get error_400 => 'Bad request';

  @override
  String get error_401 => 'Unauthorized access';

  @override
  String get error_403 => 'Access forbidden';

  @override
  String get error_404 => 'Data not found';

  @override
  String get error_500 => 'Internal server error';

  @override
  String get error_502 => 'Gateway error';

  @override
  String get error_503 => 'Service unavailable';

  @override
  String error_unknown_server(Object statusCode) {
    return 'Server error: $statusCode';
  }

  @override
  String get error_no_connection => 'No network connection, please check again';

  @override
  String get error_canceled => 'Request canceled';

  @override
  String get error_send_timeout => 'Sending data timed out';

  @override
  String get error_bad_certificate => 'Invalid SSL certificate';

  @override
  String error_unknown(Object message) {
    return 'Unknown error: $message';
  }

  @override
  String syntax_error_format(Object message) {
    return 'Invalid data: $message';
  }

  @override
  String get syntax_error_type => 'Data processing error: Invalid data type';

  @override
  String get syntax_error_no_method =>
      'Processing error: Method does not exist';

  @override
  String syntax_error_range(Object message) {
    return 'Data access error: $message';
  }

  @override
  String syntax_error_argument(Object message) {
    return 'Invalid argument: $message';
  }

  @override
  String syntax_error_state(Object message) {
    return 'State error: $message';
  }

  @override
  String syntax_error_unsupported(Object message) {
    return 'Unsupported feature: $message';
  }

  @override
  String get syntax_error_unimplemented => 'Feature not implemented';

  @override
  String syntax_error_assertion(Object message) {
    return 'Logic error: $message';
  }

  @override
  String get success_operation => 'Operation successful';

  @override
  String get todo_add_success => 'Added successfully';

  @override
  String get todo_update_success => 'Updated successfully';

  @override
  String get todo_update_status_success => 'Status updated successfully';

  @override
  String get todo_delete_success => 'Deleted successfully';
}
