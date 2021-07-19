import 'package:flutter/material.dart';

// Bt
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';

class BtHeaderWidget extends StatelessWidget {
  final IconData? rightIcon;
  final Function? rightOnPress;
  final IconData? leftIcon;
  final Function? leftOnPress;
  final double bottom;

  BtHeaderWidget({
    Key? key,
    this.rightIcon,
    this.rightOnPress,
    this.leftIcon,
    this.leftOnPress,
    this.bottom: 20,
  }) : super(key: key);

  Widget _renderIconButton(IconData icon, Function onPress) {
    return RawMaterialButton(
      constraints: BoxConstraints(minWidth: 0, minHeight: 0),
      child: Icon(icon, size: 23, color: BtColorTheme.WHITE),
      padding: EdgeInsets.all(10),
      shape: CircleBorder(
        side: BorderSide(width: 0.3, color: BtColorTheme.WHITE),
      ),
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
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: this.bottom),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[_renderLeft(), _renderRight()],
      ),
    );
  }
}
