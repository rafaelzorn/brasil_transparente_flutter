import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/routes/bt_routes.dart';
import 'package:brasil_transparente_flutter/app/modules/deputies/pages/deputies_page.dart';
import 'package:brasil_transparente_flutter/app/modules/deputies/deputies_binding.dart';
import 'package:brasil_transparente_flutter/app/modules/search/pages/search_page.dart';
import 'package:brasil_transparente_flutter/app/modules/search/search_binding.dart';
import 'package:brasil_transparente_flutter/app/modules/deputy_detail/pages/deputy_detail_page.dart';
import 'package:brasil_transparente_flutter/app/modules/deputy_detail/deputy_detail_binding.dart';

class BtPages {
  static final List<GetPage> routes = [
    GetPage(
      name: BtRoutes.deputies,
      page: () => const DeputiesPage(),
      binding: DeputiesBinding(),
    ),
    GetPage(
      name: BtRoutes.search,
      page: () => const SearchPage(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: BtRoutes.deputyDetail,
      page: () => const DeputyDetailPage(),
      binding: DeputyDetailBinding(),
    ),
  ];
}
