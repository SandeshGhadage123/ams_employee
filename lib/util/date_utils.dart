import 'package:intl/intl.dart';

class DateUtil {
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
}
