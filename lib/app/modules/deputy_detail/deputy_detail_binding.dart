import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/deputy_detail/controllers/deputy_detail_controller.dart';
import 'package:brasil_transparente_flutter/app/modules/deputy_profile/controllers/deputy_profile_controller.dart';
import 'package:brasil_transparente_flutter/app/modules/deputy_expenses/controllers/deputy_expenses_controller.dart';
import 'package:brasil_transparente_flutter/app/modules/deputy_propositions/controllers/deputy_propositions_controller.dart';
import 'package:brasil_transparente_flutter/app/modules/deputy_propositions/controllers/proposition_detail_controller.dart';
import 'package:brasil_transparente_flutter/app/data/repositories/deputy_repository.dart';
import 'package:brasil_transparente_flutter/app/data/repositories/proposition_repository.dart';
import 'package:brasil_transparente_flutter/app/data/repositories/procedure_repository.dart';
import 'package:brasil_transparente_flutter/app/data/repositories/expense_repository.dart';
import 'package:brasil_transparente_flutter/app/services/proposition_detail_service.dart';

class DeputyDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeputyRepository>(() => DeputyRepository(Get.find()));
    Get.lazyPut<PropositionRepository>(() => PropositionRepository(Get.find()));
    Get.lazyPut<ProcedureRepository>(() => ProcedureRepository(Get.find()));
    Get.lazyPut<ExpenseRepository>(() => ExpenseRepository(Get.find()));

    Get.lazyPut<PropositionDetailService>(
      () => PropositionDetailService(Get.find(), Get.find()),
    );

    Get.lazyPut<DeputyDetailController>(() => DeputyDetailController());
    Get.lazyPut<DeputyProfileController>(
      () => DeputyProfileController(Get.find()),
    );    
    Get.lazyPut<DeputyPropositionsController>(
      () => DeputyPropositionsController(Get.find()),
    );
    Get.lazyPut<DeputyExpensesController>(
      () => DeputyExpensesController(Get.find()),
    );
    Get.lazyPut<PropositionDetailController>(
      () => PropositionDetailController(Get.find()),
    );
  }
}
