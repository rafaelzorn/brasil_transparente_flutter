import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/routes/routes.dart';
import 'package:brasil_transparente_flutter/app/routes/pages.dart';
import 'package:brasil_transparente_flutter/app/resources/strings.dart';
import 'package:brasil_transparente_flutter/app/theme/theme.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: BtStrings.APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: btTheme,
      initialRoute: BtRoutes.DEPUTIES,
      getPages: BtPages.routes,
    ),
  );
}
