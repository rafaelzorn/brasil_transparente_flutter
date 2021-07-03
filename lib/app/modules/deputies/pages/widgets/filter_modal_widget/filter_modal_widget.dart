import 'package:flutter/material.dart';
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/resources/string_resource.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';

class FilterModalWidget extends StatelessWidget {
  FilterModalWidget({Key? key}) : super(key: key);

  Widget _renderButtonClose() {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.only(right: 5),
        child: TextButton(
          child: Text('Limpar'),
          onPressed: () => {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(15),
            primary: BtColorTheme.BLACK,
            backgroundColor: BtColorTheme.WHITE,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
              side: BorderSide(
                color: BtColorTheme.BLACK,
              ),
            ),
            textStyle: TextHelper.style(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderButtonApplyFilters() {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: EdgeInsets.only(left: 5),
        child: TextButton(
          child: Text('Aplicar Filtros'),
          onPressed: () => Get.back(),
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(15),
            primary: BtColorTheme.WHITE,
            backgroundColor: BtColorTheme.BLACK,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
              side: BorderSide(
                color: BtColorTheme.BLACK,
              ),
            ),
            textStyle: TextHelper.style(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderButtons() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _renderButtonClose(),
          _renderButtonApplyFilters(),
        ],
      ),
    );
  }

  Widget _renderContent() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(22, 22, 22, 18),
          child: Text(
            StringResource.FILTERS,
            style: TextHelper.style(
              fontSize: 22,
              letterSpacing: 2.3,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Expanded(child: Container()),
        _renderButtons(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height * 0.8),
      child: _renderContent(),
    );
  }
}
