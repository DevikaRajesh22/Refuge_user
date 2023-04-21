import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

TimeOfDay convertPostgresTimeToTimeOfDay(String postgresTime) {
  final dateTime =
      DateFormat('yyyy-MM-dd HH:mm:ss').parse('1970-01-01 $postgresTime');
  return TimeOfDay.fromDateTime(dateTime);
}
