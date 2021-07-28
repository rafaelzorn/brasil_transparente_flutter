import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/deputy_detail/controllers/deputy_detail_controller.dart';

class DeputyDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DeputyDetailController>(DeputyDetailController());
  }
}
