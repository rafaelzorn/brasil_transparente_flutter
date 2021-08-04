import 'package:flutter/material.dart';

// Bt
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';

final ThemeData btTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: BtColorTheme.BUNKER,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(primary: BtColorTheme.WHITE),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: BtColorTheme.BUNKER,
    elevation: 0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: BtColorTheme.BLACK,
    selectedItemColor: BtColorTheme.MELROSE,
    unselectedItemColor: BtColorTheme.COMET,
    selectedLabelStyle: TextHelper.style(
      fontSize: 12,
      height: 1.5,
      letterSpacing: 1.3,
      fontWeight: FontWeight.w700,
    ),
    unselectedLabelStyle: TextHelper.style(
      fontSize: 12,
      height: 1.5,
      letterSpacing: 1.3,
      fontWeight: FontWeight.w600,
    ),
  ),
);
