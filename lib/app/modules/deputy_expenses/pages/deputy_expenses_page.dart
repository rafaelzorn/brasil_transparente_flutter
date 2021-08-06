import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/deputy_expenses/controllers/deputy_expenses_controller.dart';
import 'package:brasil_transparente_flutter/app/modules/deputy_expenses/pages/widgets/chart_widget.dart';
import 'package:brasil_transparente_flutter/app/resources/string_resource.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_swipe_calendar_widget.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_main_title_page_widget.dart';

class DeputyExpensesPage extends GetView<DeputyExpensesController> {
  Widget _renderChart() {
    return ChartWidget();
  }

  Widget _renderContent() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            BtMainTitlePageWidget(title: StringResource.EXPENSES),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: BtSwipeCalendarWidget(date: 'Agosto 2021'),
            ),
            _renderChart()
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
