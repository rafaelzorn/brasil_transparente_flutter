import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

// Bt
import 'package:brasil_transparente_flutter/bindings/application_binding.dart';
import 'package:brasil_transparente_flutter/resources/strings.dart';
import 'package:brasil_transparente_flutter/themes/colors.dart';
import 'package:brasil_transparente_flutter/themes/theme.dart';
import 'package:brasil_transparente_flutter/routes/pages.dart';
import 'package:brasil_transparente_flutter/routes/routes.dart';

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
      debugShowCheckedModeBanner: false,
      initialBinding: ApplicationBinding(),
      title: BtStrings.APP_NAME,
      theme: btTheme,
      initialRoute: BtRoutes.DEPUTIES,
      getPages: BtPages.routes,
    );
  }
}
