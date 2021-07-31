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

  BtNotificationWidget({
    required this.icon,
    this.iconSize = 90,
    required this.text,
    this.textButton,
    this.onPress,
  });

  Widget _renderButton() {
    if (this.onPress == null) {
      return Container();
    }

    return Container(
      padding: EdgeInsets.all(15),
      child: InkWell(
        onTap: () => this.onPress!(),
        child: FractionallySizedBox(
          widthFactor: 0.75,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              color: BtColorTheme.OXFORD_BLUE,
            ),
            child: Text(
              this.textButton!,
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
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: AlignmentDirectional.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(this.icon, size: this.iconSize, color: BtColorTheme.MELROSE),
          Container(
            padding: EdgeInsets.only(top: 15, bottom: 10),
            child: Text(
              this.text,
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
