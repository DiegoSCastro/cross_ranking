import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String toDateString() {
    return DateFormat('dd/MM/yyyy').format(this);
  }
}
