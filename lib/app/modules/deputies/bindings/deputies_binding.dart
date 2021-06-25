import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/deputies/controllers/deputies_controller.dart';

class DeputiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeputiesController>(() => DeputiesController());
  }
}
