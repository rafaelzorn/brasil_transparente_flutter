import 'package:flutter/material.dart';

// Bt
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';

class BtSwipeCalendarWidget extends StatelessWidget {
  final String date;

  BtSwipeCalendarWidget({required this.date});

  Widget _renderIcon({required icon}) {
    return RawMaterialButton(
      constraints: BoxConstraints(minWidth: 0, minHeight: 0),
      child: Icon(icon, size: 23, color: BtColorTheme.WHITE),
      padding: EdgeInsets.all(10),
      shape: CircleBorder(
        side: BorderSide(width: 0.5, color: BtColorTheme.SLATE_GRAY),
      ),
      onPressed: () => {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        _renderIcon(icon: Icons.chevron_left),
        Container(
          width: 180,
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: BtColorTheme.SLATE_GRAY, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Text(
            this.date,
            style: TextHelper.style(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: BtColorTheme.WHITE,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        _renderIcon(icon: Icons.chevron_right),
      ],
    );
  }
}
