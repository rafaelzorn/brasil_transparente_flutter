import 'package:flutter/material.dart';

// Bt
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';

class BtAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final IconData? rightIcon;
  final Function? rightOnPress;
  final IconData? leftIcon;
  final Function? leftOnPress;

  const BtAppBarWidget({
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
      constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      child: Icon(icon, size: 23, color: BtColorTheme.white),
      padding: const EdgeInsets.all(10),
      shape: const CircleBorder(
        side: BorderSide(width: 0.5, color: BtColorTheme.slateGray),
      ),
      onPressed: () => onPress(),
    );
  }

  Widget _renderLeft() {
    if (leftOnPress == null) {
      return Container();
    }

    return _renderIconButton(leftIcon!, leftOnPress!);
  }

  Widget _renderRight() {
    if (rightIcon == null) {
      return Container();
    }

    return _renderIconButton(rightIcon!, rightOnPress!);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: <Widget>[
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
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
