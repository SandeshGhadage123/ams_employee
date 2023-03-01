import 'package:intl/intl.dart';

class DateUtil {

  static String getMonth(String dateTime) {
    final DateFormat formatter = DateFormat('MM');
    final String formatted = formatter.format(DateTime.parse(dateTime).toLocal());
    return formatted;
  }

  static String getDay(String dateTime) {
    final DateFormat formatter = DateFormat('EEEE');
    final String formatted = formatter.format(DateTime.parse(dateTime));
    return formatted;
  }

  static String getTime(String dateTime) {
    final DateFormat formatter = DateFormat('hh:mm a');
    final String formatted = formatter.format(DateTime.parse(dateTime).toLocal());
    return formatted;
  }

  static String getHour(String dateTime) {
    final DateFormat formatter = DateFormat('H');
    final String formatted = formatter.format(DateTime.parse(dateTime).toLocal());
    return formatted;
  }

  static String getMinutes(String dateTime) {

    final DateFormat formatter = DateFormat('aaa');
    final String formatted = formatter.format(DateTime.parse(dateTime).toLocal());
    return formatted;
  }
}
