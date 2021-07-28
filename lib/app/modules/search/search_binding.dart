import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/search/controllers/search_controller.dart';
import 'package:brasil_transparente_flutter/app/modules/search/controllers/select_state_controller.dart';
import 'package:brasil_transparente_flutter/app/modules/search/controllers/select_political_party_controller.dart';
import 'package:brasil_transparente_flutter/app/data/repositories/state_repository.dart';
import 'package:brasil_transparente_flutter/app/data/repositories/political_party_repository.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StateRepository(Get.find()));
    Get.lazyPut(() => PoliticalPartyRepository(Get.find()));
    Get.put(SearchController(), permanent: true);
    Get.put(SelectStateController(Get.find()), permanent: true);
    Get.put(SelectPoliticalPartyController(Get.find()), permanent: true);
  }
}
