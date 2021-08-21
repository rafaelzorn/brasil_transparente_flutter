// Bt
import 'package:brasil_transparente_flutter/app/data/models/expense_model.dart';
import 'package:brasil_transparente_flutter/app/helpers/format_helper.dart';

class ExpenseHelper {
  static String sumDocumentValues({required List<ExpenseModel> expenses}) {
    double total = 0;

    for (dynamic expense in expenses) {
      total += expense.totalValueMonth;
    }

    return FormatHelper.formatMoney(value: total);
  }
}
