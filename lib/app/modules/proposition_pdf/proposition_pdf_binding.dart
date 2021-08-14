import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/proposition_pdf/controllers/proposition_pdf_controller.dart';

class PropositionPdfBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropositionPdfController>(() => PropositionPdfController());
  }
}
