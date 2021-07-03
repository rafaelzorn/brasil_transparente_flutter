import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Bt
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';

class TextHelper {
  static TextStyle style({
    required double fontSize,
    double letterSpacing = 1,
    FontWeight fontWeight = FontWeight.w700,
    Color color = BtColorTheme.BLACK,
    double height = 1
  }) {
    return GoogleFonts.questrial(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      height: height,
    );
  }
}
