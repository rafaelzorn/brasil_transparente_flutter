import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

// Bt
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';

class DeputyExpense {
  final String year;
  final double sales;

  DeputyExpense(this.year, this.sales);
}

class ChartWidget extends StatelessWidget {
  static List<charts.Series<DeputyExpense, String>> _deputyExpenses() {
    final data = [
      new DeputyExpense('Jan', 800.00),
      new DeputyExpense('Fev', 1000.00),
      new DeputyExpense('Mar', 20000.00),
      new DeputyExpense('Abr', 29000.00),
      new DeputyExpense('Mai', 17000.00),
      new DeputyExpense('Jun', 9000.00),
      new DeputyExpense('Jul', 23000.00),
      new DeputyExpense('Ago', 17000.00),
      new DeputyExpense('Set', 2050.00),
      new DeputyExpense('Out', 34000.00),
      new DeputyExpense('Nov', 19000.00),
      new DeputyExpense('Dez', 80000.00),
    ];

    return [
      new charts.Series<DeputyExpense, String>(
        id: 'Sales',
        domainFn: (DeputyExpense sales, _) => sales.year,
        measureFn: (DeputyExpense sales, _) => sales.sales,
        data: data,
      )
    ];
  }

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
          SizedBox(height: 4),
          Text(
            'Despesas totais no ano de 2021',
            style: TextHelper.style(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: BtColorTheme.SLATE_GRAY,
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderContent() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: BtColorTheme.EBONY_CLAY,
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
          return LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [BtColorTheme.MELROSE, BtColorTheme.WHITE],
            stops: [
              0.0,
              1.0,
            ],
          ).createShader(bounds);
        },
        blendMode: BlendMode.srcATop,
        child: charts.BarChart(
          _deputyExpenses(),
          animate: true,
          primaryMeasureAxis: charts.NumericAxisSpec(
            tickProviderSpec: charts.BasicNumericTickProviderSpec(
              desiredTickCount: 4,
            ),
            showAxisLine: true,
            renderSpec: charts.GridlineRendererSpec(
              labelStyle: charts.TextStyleSpec(
                fontSize: 7, // size in Pts.
                color: charts.ColorUtil.fromDartColor(BtColorTheme.SLATE_GRAY),
              ),
            ),
          ),
          domainAxis: charts.OrdinalAxisSpec(
            showAxisLine: false,
            renderSpec: charts.SmallTickRendererSpec(
              labelOffsetFromAxisPx: 8,
              labelStyle: charts.TextStyleSpec(
                fontSize: 8,
                color: charts.ColorUtil.fromDartColor(BtColorTheme.SLATE_GRAY),
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
