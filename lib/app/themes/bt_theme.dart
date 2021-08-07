import 'package:flutter/material.dart';

// Bt
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';

final ThemeData btTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: BtColorTheme.bunker,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(primary: BtColorTheme.white),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: BtColorTheme.bunker,
    elevation: 0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: BtColorTheme.black,
    selectedItemColor: BtColorTheme.melrose,
    unselectedItemColor: BtColorTheme.comet,
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
