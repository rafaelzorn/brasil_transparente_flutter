import 'package:flutter/material.dart';

// Bt
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';

class BtSwipeCalendarWidget extends StatelessWidget {
  final String date;

  const BtSwipeCalendarWidget({Key? key, required this.date}) : super(key: key);

  Widget _renderIcon({required icon}) {
    return RawMaterialButton(
      constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      child: Icon(icon, size: 23, color: BtColorTheme.white),
      padding: const EdgeInsets.all(10),
      shape: const CircleBorder(
        side: BorderSide(width: 0.5, color: BtColorTheme.slateGray),
      ),
      onPressed: () => {},
    );
  }

  Widget _renderDate() {
    return Container(
      width: 180,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: BtColorTheme.slateGray, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Text(
        date,
        style: TextHelper.style(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: BtColorTheme.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        _renderIcon(icon: Icons.chevron_left),
        _renderDate(),
        _renderIcon(icon: Icons.chevron_right),
      ],
    );
  }
}
