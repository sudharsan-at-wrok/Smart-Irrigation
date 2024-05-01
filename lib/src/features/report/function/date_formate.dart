import 'package:intl/intl.dart';

String formatDate(DateTime now) {
  DateFormat formatter = DateFormat('dd-MM-yyyy');

  String formattedDate = formatter.format(now);
  return formattedDate;
}
