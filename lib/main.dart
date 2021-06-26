import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

// Bt
import 'package:brasil_transparente_flutter/app/routes/routes.dart';
import 'package:brasil_transparente_flutter/app/routes/pages.dart';
import 'package:brasil_transparente_flutter/app/resources/strings.dart';
import 'package:brasil_transparente_flutter/app/theme/theme.dart';
import 'package:brasil_transparente_flutter/app/theme/colors.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: BtColors.TRANSPARENT),
    );

    return GetMaterialApp(
      title: BtStrings.APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: btTheme,
      initialRoute: BtRoutes.DEPUTIES,
      getPages: BtPages.routes,
    );
  }
}
