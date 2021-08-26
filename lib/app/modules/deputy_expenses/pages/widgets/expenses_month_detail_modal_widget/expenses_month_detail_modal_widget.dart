import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/deputy_expenses/controllers/expenses_month_detail_controller.dart';
import 'package:brasil_transparente_flutter/app/data/models/expense_model.dart';
import 'package:brasil_transparente_flutter/app/modules/deputy_expenses/controllers/deputy_expenses_controller.dart';
import 'package:brasil_transparente_flutter/app/modules/deputy_expenses/pages/widgets/expenses_month_detail_modal_widget/expense_widget.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_close_button_modal_widget.dart';
import 'package:brasil_transparente_flutter/app/helpers/format_helper.dart';
import 'package:brasil_transparente_flutter/app/helpers/date_helper.dart';
import 'package:brasil_transparente_flutter/app/resources/string_resource.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_spinner_widget.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_notification_widget.dart';

class ExpensesMonthDetailModalWidget extends StatelessWidget {
  const ExpensesMonthDetailModalWidget({Key? key}) : super(key: key);

  Widget _renderList() {
    final ExpensesMonthDetailController controller =
        ExpensesMonthDetailController.to;

    if (controller.isLoading) {
      return const Center(
        child: SizedBox(
          height: 30,
          width: 30,
          child: BtSpinnerWidget(),
        ),
      );
    }

    if (controller.isError) {
      return BtNotificationWidget(
        icon: Icons.error_outline,
        text: StringResource.somethingWrongHasHappened,
        iconSize: 70,
        textButton: StringResource.tryAgain,
        onPress: controller.reload,
      );
    }

    return LazyLoadScrollView(
      onEndOfPage: controller.nextPage,
      isLoading: controller.lastPage,
      child: RefreshIndicator(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ExpenseWidget(expense: controller.expenses[index]);
          },
          itemCount: controller.expenses.length,
        ),
        onRefresh: controller.refresh,
      ),
    );
  }

  Widget _renderContent() {
    final ExpenseModel selectedExpenseMonth =
        DeputyExpensesController.to.selectedExpenseMonth();

    final String month = DateHelper.month(
      month: (selectedExpenseMonth.month! - 1),
    );

    final year = DeputyExpensesController.to.year;

    return Column(children: <Widget>[
      Container(
          padding: const EdgeInsets.only(top: 25, bottom: 15),
          child: Column(
            children: <Widget>[
              Text(
                '${StringResource.expenses} ${month.toLowerCase()} ${StringResource.of} $year',
                style: TextHelper.style(
                  fontSize: 20,
                  color: BtColorTheme.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                '${StringResource.total} ${FormatHelper.formatMoney(value: selectedExpenseMonth.totalValueMonth!)}',
                style: TextHelper.style(
                  fontSize: 22,
                  color: BtColorTheme.slateGray,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )),
      Expanded(child: _renderList()),
      const BtCloseButtonModalWidget(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: (MediaQuery.of(context).size.height * 0.8),
      child: Obx(() => _renderContent()),
    );
  }
}
