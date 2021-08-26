import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/models/expense_model.dart';
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';
import 'package:brasil_transparente_flutter/app/helpers/format_helper.dart';
import 'package:brasil_transparente_flutter/app/routes/bt_routes.dart';
import 'package:brasil_transparente_flutter/app/resources/string_resource.dart';

class ExpenseWidget extends StatelessWidget {
  final ExpenseModel expense;

  const ExpenseWidget({Key? key, required this.expense}) : super(key: key);

  Widget _renderInformation() {
    return Expanded(
      flex: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${StringResource.value} ${FormatHelper.formatMoney(value: expense.documentValue)}',
            style: TextHelper.style(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            expense.expenseType ?? '-',
            style: TextHelper.style(
              fontSize: 11,
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
          onPressed: () => Get.toNamed(
            BtRoutes.propositionPdf,
            preventDuplicates: false,
            arguments: {
              'pdf': expense.documentUrl,
            },
          ),
        ),
      ),
    );
  }

  Widget _renderContent() {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1, color: BtColorTheme.ebonyClay),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    expense.providerName ?? '-',
                    style: TextHelper.style(
                      fontSize: 11,
                      height: 1.3,
                      color: BtColorTheme.white,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Row(
                  children: <Widget>[
                    const Icon(
                      Icons.calendar_today,
                      size: 11,
                      color: BtColorTheme.white,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      FormatHelper.formatDate(expense.documentDate),
                      style: TextHelper.style(
                        fontSize: 11,
                        height: 1.3,
                        color: BtColorTheme.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Row(children: <Widget>[_renderInformation(), _renderIcon()]),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: const BoxDecoration(
        color: BtColorTheme.oxfordBlue,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: _renderContent(),
    );
  }
}
