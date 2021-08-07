import 'package:flutter/material.dart';

// bt
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';

class BtNotificationWidget extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final String text;
  final String? textButton;
  final Function? onPress;

  const BtNotificationWidget({
    Key? key,
    required this.icon,
    this.iconSize = 90,
    required this.text,
    this.textButton,
    this.onPress,
  }) : super(key: key);

  Widget _renderButton() {
    if (onPress == null) {
      return Container();
    }

    return Container(
      padding: const EdgeInsets.all(15),
      child: InkWell(
        onTap: () => onPress!(),
        child: FractionallySizedBox(
          widthFactor: 0.75,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              color: BtColorTheme.oxfordBlue,
            ),
            child: Text(
              textButton!,
              textAlign: TextAlign.center,
              style: TextHelper.style(
                fontSize: 14,
                height: 1.5,
              ), //BtTextTheme.notificationButton,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: AlignmentDirectional.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: iconSize, color: BtColorTheme.melrose),
          Container(
            padding: const EdgeInsets.only(top: 15, bottom: 10),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextHelper.style(fontSize: 14, height: 1.5),
            ),
          ),
          _renderButton(),
        ],
      ),
    );
  }
}
