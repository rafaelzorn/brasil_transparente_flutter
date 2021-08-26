import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/expense_document_pdf/controllers/expense_document_pdf_controller.dart';

class ExpenseDocumentPdfBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExpenseDocumentPdfController>(
      () => ExpenseDocumentPdfController(),
    );
  }
}
