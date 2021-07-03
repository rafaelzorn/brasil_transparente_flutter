import 'package:flutter/material.dart';

// Bt
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';

class BtHeaderWidget extends StatelessWidget {
  final IconData? rightIcon;
  final Function? rightOnPress;
  final IconData? leftIcon;
  final Function? leftOnPress;

  BtHeaderWidget({
    Key? key,
    this.rightIcon,
    this.rightOnPress,
    this.leftIcon,
    this.leftOnPress,
  }) : super(key: key);

  Widget _renderIconButton(IconData icon, Function onPress) {
    return RawMaterialButton(
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      constraints: BoxConstraints(minWidth: 0, minHeight: 0),
      fillColor: BtColorTheme.CARARRA,
      child: Icon(icon, size: 25, color: BtColorTheme.BLACK),
      padding: EdgeInsets.all(10),
      shape: CircleBorder(),
      onPressed: () => onPress(),
    );
  }

  Widget _renderLeft() {
    if (this.leftOnPress == null) {
      return Container();
    }

    return _renderIconButton(this.leftIcon!, this.leftOnPress!);
  }

  Widget _renderRight() {
    if (this.rightIcon == null) {
      return Container();
    }

    return _renderIconButton(this.rightIcon!, this.rightOnPress!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _renderLeft(),
          _renderRight(),
        ],
      ),
    );
  }
}
