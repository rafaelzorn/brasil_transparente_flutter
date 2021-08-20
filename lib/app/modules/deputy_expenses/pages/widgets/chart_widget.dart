import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/models/expense_model.dart';
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';
import 'package:brasil_transparente_flutter/app/helpers/date_helper.dart';

class DeputyExpense {
  final String year;
  final double sales;

  DeputyExpense(this.year, this.sales);
}

class ChartWidget extends StatelessWidget {
  final List<ExpenseModel> expenses;

  const ChartWidget({Key? key, required this.expenses}) : super(key: key);

  Widget _renderTitle() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'R\$ 153.532,12',
            style: TextHelper.style(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 4),
          Text(
            'Despesas totais no ano de 2021',
            style: TextHelper.style(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: BtColorTheme.slateGray,
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderContent() {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: BtColorTheme.ebonyClay,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: <Widget>[_renderTitle(), _renderChart()],
      ),
    );
  }

  Widget _renderChart() {
    return AspectRatio(
      aspectRatio: 2.0,
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [BtColorTheme.melrose, BtColorTheme.white],
            stops: [0.0, 1.0],
          ).createShader(bounds);
        },
        blendMode: BlendMode.srcATop,
        child: charts.BarChart(
          [
            charts.Series<ExpenseModel, String>(
              id: 'expenses',
              domainFn: (ExpenseModel expense, _) => DateHelper.month(
                month: (expense.month! - 1),
              ).substring(0, 3),
              measureFn: (ExpenseModel expense, _) => expense.totalValueMonth,
              data: expenses,
            )
          ],
          animate: true,
          primaryMeasureAxis: charts.NumericAxisSpec(
            tickProviderSpec: const charts.BasicNumericTickProviderSpec(
              desiredTickCount: 4,
            ),
            showAxisLine: true,
            renderSpec: charts.GridlineRendererSpec(
              labelStyle: charts.TextStyleSpec(
                fontSize: 7, // size in Pts.
                color: charts.ColorUtil.fromDartColor(BtColorTheme.slateGray),
              ),
            ),
          ),
          domainAxis: charts.OrdinalAxisSpec(
            showAxisLine: false,
            renderSpec: charts.SmallTickRendererSpec(
              labelOffsetFromAxisPx: 8,
              labelStyle: charts.TextStyleSpec(
                fontSize: 8,
                color: charts.ColorUtil.fromDartColor(BtColorTheme.slateGray),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _renderContent();
  }
}
