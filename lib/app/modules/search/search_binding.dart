import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/search/controllers/search_controller.dart';
import 'package:brasil_transparente_flutter/app/modules/search/controllers/states_controller.dart';
import 'package:brasil_transparente_flutter/app/modules/search/controllers/political_parties_controller.dart';
import 'package:brasil_transparente_flutter/app/data/repositories/state_repository.dart';
import 'package:brasil_transparente_flutter/app/data/repositories/political_party_repository.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StateRepository>(() => StateRepository(Get.find()));
    Get.lazyPut<PoliticalPartyRepository>(
      () => PoliticalPartyRepository(Get.find()),
    );

    Get.put<SearchController>(SearchController(), permanent: true);
    Get.put<StatesController>(
      StatesController(Get.find()),
      permanent: true,
    );
    Get.put<PoliticalPartiesController>(
      PoliticalPartiesController(Get.find()),
      permanent: true,
    );
  }
}
