import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/routes/bt_routes.dart';
import 'package:brasil_transparente_flutter/app/modules/deputies/pages/deputies_page.dart';
import 'package:brasil_transparente_flutter/app/modules/deputies/deputies_binding.dart';

class BtPages {
  static final List<GetPage> routes = [
    GetPage(
      name: BtRoutes.DEPUTIES,
      page: () => DeputiesPage(),
      binding: DeputiesBinding(),
    ),
  ];
}
