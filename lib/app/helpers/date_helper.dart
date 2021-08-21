// Bt
import 'package:brasil_transparente_flutter/app/resources/string_resource.dart';

class DateHelper {
  static int currentYear() {
    DateTime now = DateTime.now();

    return now.year;
  }

  static String formatDateMonthYear({
    required int month,
    required int year,
  }) {
    final String formatMonth = DateHelper.month(month: month);

    return '$formatMonth ${year.toString()}';
  }

  static String month({required int month}) {
    List months = [
      StringResource.january,
      StringResource.february,
      StringResource.march,
      StringResource.april,
      StringResource.may,
      StringResource.june,
      StringResource.july,
      StringResource.august,
      StringResource.september,
      StringResource.october,
      StringResource.november,
      StringResource.december,
    ];

    return months[month];
  }
}
