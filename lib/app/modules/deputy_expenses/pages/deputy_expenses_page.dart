import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/deputy_expenses/controllers/deputy_expenses_controller.dart';
import 'package:brasil_transparente_flutter/app/modules/deputy_expenses/pages/widgets/chart_widget.dart';
import 'package:brasil_transparente_flutter/app/resources/string_resource.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_swipe_calendar_widget.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_main_title_page_widget.dart';

class DeputyExpensesPage extends GetView<DeputyExpensesController> {
  const DeputyExpensesPage({Key? key}) : super(key: key);

  Widget _renderChart() {
    return const ChartWidget();
  }

  Widget _renderSwipeCalendar() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: const BtSwipeCalendarWidget(date: 'Agosto 2021'),
    );
  }

  Widget _renderContent() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: <Widget>[
            const BtMainTitlePageWidget(title: StringResource.expenses),
            _renderSwipeCalendar(),
            _renderChart(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _renderContent();
  }
}
