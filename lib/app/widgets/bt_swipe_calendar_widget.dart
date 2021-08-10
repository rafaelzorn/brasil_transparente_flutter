import 'package:flutter/material.dart';

// Bt
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';

class BtSwipeCalendarWidget extends StatelessWidget {
  final String date;
  final Function onPressedLeft;
  final Function onPressedRight;
  final bool hideRightButton;

  const BtSwipeCalendarWidget({
    Key? key,
    required this.date,
    required this.onPressedLeft,
    required this.onPressedRight,
    required this.hideRightButton,
  }) : super(key: key);

  Widget _renderIcon({required icon, required onPressed}) {
    return RawMaterialButton(
      constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      child: Icon(icon, size: 23, color: BtColorTheme.white),
      padding: const EdgeInsets.all(10),
      shape: const CircleBorder(
        side: BorderSide(width: 0.5, color: BtColorTheme.slateGray),
      ),
      onPressed: () => onPressed(),
    );
  }

  Widget _renderRightButton() {
    if (hideRightButton) {
      return RawMaterialButton(
        constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        onPressed: () => {},
      );
    }

    return _renderIcon(icon: Icons.chevron_right, onPressed: onPressedRight);
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
        _renderIcon(icon: Icons.chevron_left, onPressed: onPressedLeft),
        _renderDate(),
        _renderRightButton(),
      ],
    );
  }
}
