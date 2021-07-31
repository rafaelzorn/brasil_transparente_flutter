import 'package:intl/intl.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/models/deputy_model.dart';
import 'package:brasil_transparente_flutter/app/helpers/string_helper.dart';

class DeputyHelper {
  static String about(DeputyModel deputy) {
    final String civilName = StringHelper.capitalize(
      deputy.civilName ?? '-',
      allWords: true,
    );

    return '$civilName é um deputado brasileiro pelo partido ${deputy.initialsParty ?? '-'}, nasceu em ${deputyAge(deputy.birthDate)} na cidade de ${deputy.birthCity ?? ''}/${deputy.birthState}.';
  }

  static String deputyAge(String? birthDate) {
    if (birthDate == null) {
      return '-';
    }

    return DateFormat('dd/MM/yyyy').format(DateTime.parse(birthDate));
  }
}
