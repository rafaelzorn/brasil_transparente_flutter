import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/deputy_detail/controllers/deputy_detail_controller.dart';
import 'package:brasil_transparente_flutter/app/data/repositories/deputy_repository.dart';

class DeputyDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeputyRepository>(() => DeputyRepository(Get.find()));
    Get.put<DeputyDetailController>(DeputyDetailController(Get.find()));
  }
}
