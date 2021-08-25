import 'package:flutter/material.dart';

// Bt
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_close_button_modal_widget.dart';

class ExpensesMonthDetailModalWidget extends StatelessWidget {
  const ExpensesMonthDetailModalWidget({
    Key? key,
  }) : super(key: key);

  Widget _renderContent() {
    return Column(children: <Widget>[
      Container(
          padding: const EdgeInsets.only(top: 25, bottom: 15),
          child: Column(
            children: <Widget>[
              Text(
                'Despesas agosto de 2021',
                style: TextHelper.style(
                  fontSize: 20,
                  color: BtColorTheme.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'R\$ 40.000,00',
                style: TextHelper.style(
                  fontSize: 22,
                  color: BtColorTheme.slateGray,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )),
      Expanded(child: Container()),
      const BtCloseButtonModalWidget(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: (MediaQuery.of(context).size.height * 0.8),
      child: _renderContent(),
    );
  }
}
