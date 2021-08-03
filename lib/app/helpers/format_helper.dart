import 'package:intl/intl.dart';

class FormatHelper {
  static String formatCpf(String? cpf) {
    if (cpf == null) return '-';

    var numeros = cpf.replaceAll(RegExp(r'[^0-9]'), '');

    if (numeros.length != 11) return cpf;

    return "${numeros.substring(0, 3)}.${numeros.substring(3, 6)}.${numeros.substring(6, 9)}-${numeros.substring(9)}";
  }

  static String formatDate(String? date) {
    if (date == null) {
      return '-';
    }

    return DateFormat('dd/MM/yyyy').format(DateTime.parse(date));
  }
}
