import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/routes/routes.dart';
import 'package:brasil_transparente_flutter/app/modules/deputies/views/deputies_view.dart';
import 'package:brasil_transparente_flutter/app/modules/deputies/bindings/deputies_binding.dart';

class BtPages {
  static final List<GetPage> routes = [
    GetPage(name: BtRoutes.DEPUTIES, page: () => DeputiesView(), binding: DeputiesBinding())
  ];
}
