import 'package:intl/intl.dart';

class Common {
  static DateTime parseTodoTimeToday(String timeString) {
    final parts = timeString.split(':');
    final now = DateTime.now();

    return DateTime(
      now.year,
      now.month,
      now.day,
      int.parse(parts[0]),
      int.parse(parts[1]),
      int.parse(parts[2]),
    );
  }

  static String formatLongDate(DateTime date) {
    return DateFormat('MMMM d, yyyy').format(date);
  }

  static String convertTime24to12(String time24) {
    final date = DateFormat('HH:mm:ss').parse(time24);
    return DateFormat('hh:mm a').format(date);
  }

  static String formatDateToDDMMYYYY(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static DateTime? parseDateFromDDMMYYYY(String dateString) {
    return DateFormat('dd/MM/yyyy').parseStrict(dateString);
  }

  static String convertTime12hTo24hWithSeconds(String time12h) {
    final dateTime = DateFormat('hh:mm a').parse(time12h);
    return DateFormat('HH:mm:ss').format(dateTime);
  }

  static String formatPickedTimeTo12h(int hour, int minute) {
    final now = DateTime.now();
    final dateTime = DateTime(now.year, now.month, now.day, hour, minute);
    return DateFormat('hh:mm a').format(dateTime);
  }

  static bool isDateTimeExpired(DateTime date, String time) {
    final parts = time.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);
    final second = int.parse(parts[2]);

    final targetDateTime = DateTime(
      date.year,
      date.month,
      date.day,
      hour,
      minute,
      second,
    );

    return DateTime.now().isAfter(targetDateTime);
  }
}