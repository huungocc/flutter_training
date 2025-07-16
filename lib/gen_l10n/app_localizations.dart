import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi'),
  ];

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @digit_clock.
  ///
  /// In en, this message translates to:
  /// **'Digit Clock'**
  String get digit_clock;

  /// No description provided for @movie.
  ///
  /// In en, this message translates to:
  /// **'Movie'**
  String get movie;

  /// No description provided for @todo.
  ///
  /// In en, this message translates to:
  /// **'Todo'**
  String get todo;

  /// No description provided for @discover_your_dream.
  ///
  /// In en, this message translates to:
  /// **'Discover Your Dream Job here'**
  String get discover_your_dream;

  /// No description provided for @explorer_all_job.
  ///
  /// In en, this message translates to:
  /// **'Explore all the existing job roles based on your interest and study major'**
  String get explorer_all_job;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @login_here.
  ///
  /// In en, this message translates to:
  /// **'Login here'**
  String get login_here;

  /// No description provided for @welcome_back.
  ///
  /// In en, this message translates to:
  /// **'Welcome back you’ve been missed!'**
  String get welcome_back;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get forgot_password;

  /// No description provided for @sign_in.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get sign_in;

  /// No description provided for @create_new_account.
  ///
  /// In en, this message translates to:
  /// **'Create new account'**
  String get create_new_account;

  /// No description provided for @create_account.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get create_account;

  /// No description provided for @create_account_explore.
  ///
  /// In en, this message translates to:
  /// **'Create an account so you can explore all the existing jobs'**
  String get create_account_explore;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirm_password;

  /// No description provided for @sign_up.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get sign_up;

  /// No description provided for @already_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account'**
  String get already_account;

  /// No description provided for @or_continue.
  ///
  /// In en, this message translates to:
  /// **'Or continue with'**
  String get or_continue;

  /// No description provided for @movies.
  ///
  /// In en, this message translates to:
  /// **'Movies'**
  String get movies;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @count_minutes.
  ///
  /// In en, this message translates to:
  /// **'{count} minutes'**
  String count_minutes(Object count);

  /// No description provided for @my_todo_list.
  ///
  /// In en, this message translates to:
  /// **'My Todo List'**
  String get my_todo_list;

  /// No description provided for @add_new_task.
  ///
  /// In en, this message translates to:
  /// **'Add New Task'**
  String get add_new_task;

  /// No description provided for @task_title.
  ///
  /// In en, this message translates to:
  /// **'Task Title'**
  String get task_title;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @loading_movies.
  ///
  /// In en, this message translates to:
  /// **'Loading movies...'**
  String get loading_movies;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @edit_task.
  ///
  /// In en, this message translates to:
  /// **'Edit Task'**
  String get edit_task;

  /// No description provided for @error_connection_timeout.
  ///
  /// In en, this message translates to:
  /// **'Connection timed out, please try again'**
  String get error_connection_timeout;

  /// No description provided for @error_receive_timeout.
  ///
  /// In en, this message translates to:
  /// **'Receiving data timed out, please try again'**
  String get error_receive_timeout;

  /// No description provided for @error_400.
  ///
  /// In en, this message translates to:
  /// **'Bad request'**
  String get error_400;

  /// No description provided for @error_401.
  ///
  /// In en, this message translates to:
  /// **'Unauthorized access'**
  String get error_401;

  /// No description provided for @error_403.
  ///
  /// In en, this message translates to:
  /// **'Access forbidden'**
  String get error_403;

  /// No description provided for @error_404.
  ///
  /// In en, this message translates to:
  /// **'Data not found'**
  String get error_404;

  /// No description provided for @error_500.
  ///
  /// In en, this message translates to:
  /// **'Internal server error'**
  String get error_500;

  /// No description provided for @error_502.
  ///
  /// In en, this message translates to:
  /// **'Gateway error'**
  String get error_502;

  /// No description provided for @error_503.
  ///
  /// In en, this message translates to:
  /// **'Service unavailable'**
  String get error_503;

  /// No description provided for @error_unknown_server.
  ///
  /// In en, this message translates to:
  /// **'Server error: {statusCode}'**
  String error_unknown_server(Object statusCode);

  /// No description provided for @error_no_connection.
  ///
  /// In en, this message translates to:
  /// **'No network connection, please check again'**
  String get error_no_connection;

  /// No description provided for @error_canceled.
  ///
  /// In en, this message translates to:
  /// **'Request canceled'**
  String get error_canceled;

  /// No description provided for @error_send_timeout.
  ///
  /// In en, this message translates to:
  /// **'Sending data timed out'**
  String get error_send_timeout;

  /// No description provided for @error_bad_certificate.
  ///
  /// In en, this message translates to:
  /// **'Invalid SSL certificate'**
  String get error_bad_certificate;

  /// No description provided for @error_unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown error: {message}'**
  String error_unknown(Object message);

  /// No description provided for @syntax_error_format.
  ///
  /// In en, this message translates to:
  /// **'Invalid data: {message}'**
  String syntax_error_format(Object message);

  /// No description provided for @syntax_error_type.
  ///
  /// In en, this message translates to:
  /// **'Data processing error: Invalid data type'**
  String get syntax_error_type;

  /// No description provided for @syntax_error_no_method.
  ///
  /// In en, this message translates to:
  /// **'Processing error: Method does not exist'**
  String get syntax_error_no_method;

  /// No description provided for @syntax_error_range.
  ///
  /// In en, this message translates to:
  /// **'Data access error: {message}'**
  String syntax_error_range(Object message);

  /// No description provided for @syntax_error_argument.
  ///
  /// In en, this message translates to:
  /// **'Invalid argument: {message}'**
  String syntax_error_argument(Object message);

  /// No description provided for @syntax_error_state.
  ///
  /// In en, this message translates to:
  /// **'State error: {message}'**
  String syntax_error_state(Object message);

  /// No description provided for @syntax_error_unsupported.
  ///
  /// In en, this message translates to:
  /// **'Unsupported feature: {message}'**
  String syntax_error_unsupported(Object message);

  /// No description provided for @syntax_error_unimplemented.
  ///
  /// In en, this message translates to:
  /// **'Feature not implemented'**
  String get syntax_error_unimplemented;

  /// No description provided for @syntax_error_assertion.
  ///
  /// In en, this message translates to:
  /// **'Logic error: {message}'**
  String syntax_error_assertion(Object message);

  /// No description provided for @success_operation.
  ///
  /// In en, this message translates to:
  /// **'Operation successful'**
  String get success_operation;

  /// No description provided for @todo_add_success.
  ///
  /// In en, this message translates to:
  /// **'Added successfully'**
  String get todo_add_success;

  /// No description provided for @todo_update_success.
  ///
  /// In en, this message translates to:
  /// **'Updated successfully'**
  String get todo_update_success;

  /// No description provided for @todo_update_status_success.
  ///
  /// In en, this message translates to:
  /// **'Status updated successfully'**
  String get todo_update_status_success;

  /// No description provided for @todo_delete_success.
  ///
  /// In en, this message translates to:
  /// **'Deleted successfully'**
  String get todo_delete_success;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
