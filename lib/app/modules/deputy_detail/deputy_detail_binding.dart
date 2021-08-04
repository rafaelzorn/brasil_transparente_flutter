import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/deputy_detail/controllers/deputy_detail_controller.dart';
import 'package:brasil_transparente_flutter/app/modules/deputy_profile/controllers/deputy_profile_controller.dart';
import 'package:brasil_transparente_flutter/app/modules/deputy_expenses/controllers/deputy_expenses_controller.dart';
import 'package:brasil_transparente_flutter/app/modules/deputy_propositions/controllers/deputy_propositions_controller.dart';
import 'package:brasil_transparente_flutter/app/data/repositories/deputy_repository.dart';

class DeputyDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeputyRepository>(() => DeputyRepository(Get.find()));
    Get.lazyPut<DeputyDetailController>(() => DeputyDetailController());
    Get.lazyPut<DeputyProfileController>(
      () => DeputyProfileController(Get.find()),
    );
    Get.lazyPut<DeputyExpensesController>(() => DeputyExpensesController());
    Get.lazyPut<DeputyPropositionsController>(
      () => DeputyPropositionsController(),
    );
  }
}
