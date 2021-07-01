import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Bt
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';

class BtTextTheme {
  static final titleDeputies = GoogleFonts.questrial(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: BtColorTheme.TUNDORA,
    letterSpacing: 2.5,
  );

  static final nameDeputyList = GoogleFonts.questrial(
    fontSize: 14,
    fontWeight: FontWeight.w900,
    color: BtColorTheme.BLACK,
    letterSpacing: 1,
  );

  static final stateDeputyList = GoogleFonts.questrial(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: BtColorTheme.TUNDORA,
    letterSpacing: 1,
  );

  static final politicalPartyDeputyList = GoogleFonts.questrial(
    fontSize: 10,
    fontWeight: FontWeight.w900,
    color: BtColorTheme.BLACK,
    letterSpacing: 1.5,
  );

  static final notification = GoogleFonts.questrial(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: BtColorTheme.BLACK,
    letterSpacing: 1.5,
    height: 1.5,
  );

  static final notificationButton = GoogleFonts.questrial(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: BtColorTheme.BLACK,
    letterSpacing: 1.5,
    height: 1.5,
  );
}
