import 'package:intl/intl.dart';

class DateTimeModel {
  final String datetimeString;

  const DateTimeModel(this.datetimeString);

  String get getDate {
    final DateTime datetime = DateTime.parse(datetimeString);
    return DateFormat('yyyy-MM-dd').format(datetime);
  }

  String get getTime {
    final DateTime datetime = DateTime.parse(datetimeString);
    return DateFormat('h:mm a').format(datetime);
  }

  String get getDisplayDateTime {
    final DateTime datetime = DateTime.parse(datetimeString);
    return DateFormat('yyyy-MM-dd h:mm a').format(datetime);
  }
}
