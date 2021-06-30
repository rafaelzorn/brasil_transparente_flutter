import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/modules/deputies/controllers/deputies_controller.dart';
import 'package:brasil_transparente_flutter/repositories/deputy_repository.dart';

class DeputiesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DeputyRepository(Get.find()));
    Get.lazyPut(() => DeputiesController(Get.find()));
  }
}
