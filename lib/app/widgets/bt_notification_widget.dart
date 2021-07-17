import 'package:flutter/material.dart';

// bt
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';

class BtNotificationWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final String? textButton;
  final Function? onPress;

  BtNotificationWidget({
    required this.icon,
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
              border: Border.all(color: BtColorTheme.BLACK),
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
      alignment: AlignmentDirectional.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(this.icon, size: 90, color: BtColorTheme.BLACK),
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
