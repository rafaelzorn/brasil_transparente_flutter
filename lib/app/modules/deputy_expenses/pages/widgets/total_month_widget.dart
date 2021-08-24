import 'package:flutter/material.dart';

// Bt
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:brasil_transparente_flutter/app/data/models/expense_model.dart';
import 'package:brasil_transparente_flutter/app/helpers/format_helper.dart';
import 'package:brasil_transparente_flutter/app/resources/string_resource.dart';
import 'package:brasil_transparente_flutter/app/helpers/date_helper.dart';

class TotalMonthWidget extends StatelessWidget {
  final ExpenseModel expense;

  const TotalMonthWidget({
    Key? key,
    required this.expense,
  }) : super(key: key);

  Widget _renderInformation() {
    final String month = DateHelper.month(
      month: (expense.month! - 1),
    );

    return Expanded(
      flex: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            FormatHelper.formatMoney(value: expense.totalValueMonth!),
            style: TextHelper.style(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '${StringResource.totalExpensesForTheMonthOf} ${month.toLowerCase()}',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextHelper.style(
              fontSize: 13,
              height: 1.3,
              color: BtColorTheme.slateGray,
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderIcon() {
    return Expanded(
      flex: 2,
      child: Align(
        alignment: Alignment.centerRight,
        child: RawMaterialButton(
          constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
          child: const Icon(
            Icons.visibility_outlined,
            size: 15,
            color: BtColorTheme.white,
          ),
          padding: const EdgeInsets.all(10),
          shape: const CircleBorder(
            side: BorderSide(width: 0.5, color: BtColorTheme.slateGray),
          ),
          onPressed: () {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        color: BtColorTheme.ebonyClay,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[_renderInformation(), _renderIcon()],
      ),
    );
  }
}
