import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Bt
import 'package:brasil_transparente_flutter/app/theme/colors.dart';

class BtTextStyles {
  static final titleDeputies = GoogleFonts.questrial(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: BtColors.BLACK,
    letterSpacing: 2.5,
  );

  static final nameDeputyList = GoogleFonts.questrial(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: BtColors.BLACK,
    letterSpacing: 1,
  );

  static final stateDeputyList = GoogleFonts.questrial(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: BtColors.TUNDORA,
    letterSpacing: 1,
  );

  static final politicalPartyDeputyList = GoogleFonts.questrial(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    color: BtColors.BLACK,
    letterSpacing: 1.5,
  );
}
