import 'package:flutter/material.dart';

// Bt
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';

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
);
