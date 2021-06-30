import 'package:flutter/material.dart';

// Bt
import 'package:brasil_transparente_flutter/themes/colors.dart';

class BtSpinnerWidget extends StatelessWidget {
  final double strokeWidth;
  final Color color;

  BtSpinnerWidget({this.strokeWidth: 2, this.color: BtColors.BLACK});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: strokeWidth,
      valueColor: AlwaysStoppedAnimation<Color>(this.color),
    );
  }
}
