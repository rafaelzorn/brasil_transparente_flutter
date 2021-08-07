import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Bt
import 'package:brasil_transparente_flutter/app/bindings/application_binding.dart';
import 'package:brasil_transparente_flutter/app/resources/string_resource.dart';
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:brasil_transparente_flutter/app/themes/bt_theme.dart';
import 'package:brasil_transparente_flutter/app/routes/bt_pages.dart';
import 'package:brasil_transparente_flutter/app/routes/bt_routes.dart';

Future main() async {
  await dotenv.load(fileName: '.env');

  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: BtColorTheme.bunker,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ApplicationBinding(),
      title: StringResource.appName,
      theme: btTheme,
      initialRoute: BtRoutes.deputies,
      getPages: BtPages.routes,
    );
  }
}
