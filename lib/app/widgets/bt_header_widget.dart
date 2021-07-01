import 'package:flutter/material.dart';

// Bt
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';

class BtHeaderWidget extends StatelessWidget {
  final IconData? rightIcon;
  final Color rightIconColor;
  final Function? rightOnPress;
  final IconData? leftIcon;
  final Color leftIconColor;
  final Function? leftOnPress;

  BtHeaderWidget({
    Key? key,
    this.rightIcon,
    this.rightIconColor: BtColorTheme.TUNDORA,
    this.rightOnPress,
    this.leftIcon,
    this.leftIconColor: BtColorTheme.TUNDORA,
    this.leftOnPress,
  }) : super(key: key);

  Widget _renderIconButton(IconData icon, Color iconColor, Function onPress) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(),
      icon: Icon(icon, size: 30, color: iconColor),
      onPressed: () => onPress(),
    );
  }

  Widget _renderLeft() {
    if (this.leftOnPress == null) {
      return Container();
    }

    return _renderIconButton(
      this.leftIcon!,
      this.rightIconColor,
      this.leftOnPress!,
    );
  }

  Widget _renderRight() {
    if (this.rightIcon == null) {
      return Container();
    }

    return _renderIconButton(
      this.rightIcon!,
      this.rightIconColor,
      this.rightOnPress!,
    );
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
