import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/deputy_expenses/controllers/deputy_expenses_controller.dart';
import 'package:brasil_transparente_flutter/app/modules/deputy_expenses/pages/widgets/chart_widget.dart';
import 'package:brasil_transparente_flutter/app/modules/deputy_expenses/pages/widgets/total_month_widget.dart';
import 'package:brasil_transparente_flutter/app/resources/string_resource.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_swipe_calendar_widget.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_main_title_page_widget.dart';
import 'package:brasil_transparente_flutter/app/helpers/date_helper.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_spinner_widget.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_notification_widget.dart';

class DeputyExpensesPage extends GetView<DeputyExpensesController> {
  const DeputyExpensesPage({Key? key}) : super(key: key);

  Widget _renderSwipeCalendar() {
    final int currentMonth = int.parse(controller.currentDate.format('M')) - 1;
    final int currentYear = int.parse(controller.currentDate.format('yyyy'));
    final int currentMonthYear = int.parse(
      controller.currentDate.format('Myyyy'),
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: BtSwipeCalendarWidget(
        hideRightButton: controller.currentMonthYear == currentMonthYear,
        date: DateHelper.formatDateMonthYear(
          month: currentMonth,
          year: currentYear,
        ),
        onPressedLeft: () => controller.handleChangeMonth(
          action: controller.decrementMonth,
        ),
        onPressedRight: () => controller.handleChangeMonth(
          action: controller.incrementMonth,
        ),
        disabledButton: controller.isLoading,
      ),
    );
  }

  Widget _renderInformation() {
    if (controller.isLoading) {
      return const Center(
        child: SizedBox(height: 40, width: 40, child: BtSpinnerWidget()),
      );
    }

    if (controller.isError) {
      return BtNotificationWidget(
        icon: Icons.error_outline,
        text: StringResource.somethingWrongHasHappened,
        textButton: StringResource.tryAgain,
        onPress: controller.reload,
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ChartWidget(expenses: controller.expenses, year: controller.year),
          TotalMonthWidget(expense: controller.selectedExpenseMonth()),
        ],
      ),
    );
  }

  Widget _renderContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: <Widget>[
          const BtMainTitlePageWidget(title: StringResource.expenses),
          _renderSwipeCalendar(),
          Expanded(child: _renderInformation()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => _renderContent());
  }
}
