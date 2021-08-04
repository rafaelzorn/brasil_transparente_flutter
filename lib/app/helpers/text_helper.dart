import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Bt
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';

class TextHelper {
  static TextStyle style({
    required double fontSize,
    FontWeight fontWeight = FontWeight.w400,
    Color color = BtColorTheme.WHITE,
    double height = 1,
    double letterSpacing = 0.5,
  }) {
    return GoogleFonts.openSans(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }
}
