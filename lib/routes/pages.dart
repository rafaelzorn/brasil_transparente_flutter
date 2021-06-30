import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/routes/routes.dart';
import 'package:brasil_transparente_flutter/modules/deputies/views/deputies_view.dart';
import 'package:brasil_transparente_flutter/modules/deputies/deputies_binding.dart';

class BtPages {
  static final List<GetPage> routes = [
    GetPage(
      name: BtRoutes.DEPUTIES,
      page: () => DeputiesView(Get.find()),
      binding: DeputiesBinding(),
    )
  ];
}
