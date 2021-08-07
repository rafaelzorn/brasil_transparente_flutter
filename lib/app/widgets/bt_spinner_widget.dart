import 'package:flutter/material.dart';

// Bt
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';

class BtSpinnerWidget extends StatelessWidget {
  final double strokeWidth;
  final Color color;

  const BtSpinnerWidget({
    Key? key,
    this.strokeWidth = 2,
    this.color = BtColorTheme.slateGray,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: strokeWidth,
      valueColor: AlwaysStoppedAnimation<Color>(color),
    );
  }
}
