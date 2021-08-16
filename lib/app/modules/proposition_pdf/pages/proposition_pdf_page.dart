import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/proposition_pdf/controllers/proposition_pdf_controller.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_app_bar_widget.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_spinner_widget.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_notification_widget.dart';
import 'package:brasil_transparente_flutter/app/resources/string_resource.dart';

class PropositionPdfPage extends GetView<PropositionPdfController> {
  const PropositionPdfPage({Key? key}) : super(key: key);

  Widget _renderContent() {
    if (controller.isLoading) {
      return const Center(
        child: SizedBox(
          height: 40,
          width: 40,
          child: BtSpinnerWidget(),
        ),
      );
    }

    if (controller.isError) {
      return BtNotificationWidget(
        icon: Icons.error_outline,
        text: StringResource.somethingWrongHasHappened,
        textButton: StringResource.tryAgain,
        onPress: controller.loadDocument,
      );
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BtAppBarWidget(
        leftIcon: Icons.chevron_left,
        leftOnPress: () => Get.back(),
      ),
      body: Obx(() => _renderContent()),
    );
  }
}
