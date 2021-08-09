// Bt
import 'package:brasil_transparente_flutter/app/data/models/deputy_model.dart';
import 'package:brasil_transparente_flutter/app/helpers/string_helper.dart';
import 'package:brasil_transparente_flutter/app/helpers/format_helper.dart';
import 'package:brasil_transparente_flutter/app/constants/general_constant.dart';

class DeputyHelper {
  static String about(DeputyModel deputy) {
    final String civilName = StringHelper.capitalize(
      deputy.civilName ?? '-',
      allWords: true,
    );

    return '$civilName ${deputy.situation == GeneralConstant.exercise ? "é" : "foi"} '
        '${deputy.gender == GeneralConstant.male ? "um deputado brasileiro" : "uma deputada brasileira"} pelo partido ${deputy.initialsParty ?? '-'}, '
        'nasceu em ${FormatHelper.formatDate(deputy.birthDate)} na cidade de ${deputy.birthCity ?? ''}/${deputy.birthState}.';
  }
}
