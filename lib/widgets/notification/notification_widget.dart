import 'package:flutter/material.dart';

// bt
import 'package:brasil_transparente_flutter/themes/colors.dart';
import 'package:brasil_transparente_flutter/themes/texts_styles.dart';

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
              border: Border.all(color: BtColors.BLACK),
            ),
            child: Text(
              this.textButton!,
              textAlign: TextAlign.center,
              style: BtTextStyles.notificationButton,
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
          Icon(this.icon, size: 90, color: BtColors.DARK_GRAY),
          Container(
            padding: EdgeInsets.only(top: 15, bottom: 10),
            child: Text(
              this.text,
              textAlign: TextAlign.center,
              style: BtTextStyles.notification,
            ),
          ),
          _renderButton(),
        ],
      ),
    );
  }
}
