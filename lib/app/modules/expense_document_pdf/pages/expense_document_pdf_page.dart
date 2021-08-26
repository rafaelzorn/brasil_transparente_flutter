import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/expense_document_pdf/controllers/expense_document_pdf_controller.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_app_bar_widget.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_notification_widget.dart';
import 'package:brasil_transparente_flutter/app/resources/string_resource.dart';

class ExpenseDocumentPdfPage extends GetView<ExpenseDocumentPdfController> {
  const ExpenseDocumentPdfPage({Key? key}) : super(key: key);

  Widget _renderContent() {
    if (controller.isError) {
      return BtNotificationWidget(
        icon: Icons.error_outline,
        text: StringResource.somethingWrongHasHappened,
        textButton: StringResource.tryAgain,
        onPress: () => controller.error(false),
      );
    }

    print(Get.arguments['pdf']);

    return SfPdfViewer.network(
      Get.arguments['pdf'],
      onDocumentLoadFailed: (PdfDocumentLoadFailedDetails details) {
        controller.error(true);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BtAppBarWidget(
        leftIcon: Icons.chevron_left,
        leftOnPress: () => Get.back(),
        height: 55,
      ),
      body: Obx(() => _renderContent()),
    );
  }
}
