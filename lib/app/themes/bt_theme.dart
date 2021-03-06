import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Bt
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';

final ThemeData btTheme = ThemeData(
  primaryColor: BtColorTheme.bunker,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: BtColorTheme.bunker,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(primary: BtColorTheme.white),
  ),
  appBarTheme: const AppBarTheme(
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    backgroundColor: BtColorTheme.bunker,
    elevation: 0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: BtColorTheme.black,
    selectedItemColor: BtColorTheme.melrose,
    unselectedItemColor: BtColorTheme.comet,
    selectedLabelStyle: TextHelper.style(
      fontSize: 11,
      height: 1.5,
      letterSpacing: 1.2,
      fontWeight: FontWeight.w600,
    ),
    unselectedLabelStyle: TextHelper.style(
      fontSize: 11,
      height: 1.5,
      letterSpacing: 1.2,
      fontWeight: FontWeight.w600,
    ),
  ),
);
