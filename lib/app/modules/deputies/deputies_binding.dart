import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/deputies/controllers/deputies_controller.dart';
import 'package:brasil_transparente_flutter/app/data/repositories/deputy_repository.dart';

class DeputiesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeputyRepository>(() => DeputyRepository(Get.find()));

    Get.lazyPut<DeputiesController>(() => DeputiesController(Get.find()));
  }
}
