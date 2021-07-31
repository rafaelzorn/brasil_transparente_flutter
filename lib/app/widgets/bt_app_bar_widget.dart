import 'package:flutter/material.dart';

// Bt
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';

class BtAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final IconData? rightIcon;
  final Function? rightOnPress;
  final IconData? leftIcon;
  final Function? leftOnPress;

  BtAppBarWidget({
    Key? key,
    this.rightIcon,
    this.rightOnPress,
    this.leftIcon,
    this.leftOnPress,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(80);

  Widget _renderIconButton(IconData icon, Function onPress) {
    return RawMaterialButton(
      constraints: BoxConstraints(minWidth: 0, minHeight: 0),
      child: Icon(icon, size: 23, color: BtColorTheme.WHITE),
      padding: EdgeInsets.all(10),
      shape: CircleBorder(
        side: BorderSide(width: 0.5, color: BtColorTheme.SLATE_GRAY),
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
    return AppBar(
      automaticallyImplyLeading: false,
      actions: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[_renderLeft(), _renderRight()],
            ),
          ),
        ),
      ],
    );
  }
}
