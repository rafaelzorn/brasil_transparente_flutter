import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/deputy_propositions/controllers/proceedings_controller.dart';
import 'package:brasil_transparente_flutter/app/modules/deputy_propositions/pages/widgets/proceedings_modal_widget/procedure_widget.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_notification_widget.dart';
import 'package:brasil_transparente_flutter/app/resources/string_resource.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_spinner_widget.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_close_button_modal_widget.dart';

class ProceedingsModalWidget extends StatelessWidget {
  final ProceedingsController controller;

  const ProceedingsModalWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  Widget _renderList() {
    if (controller.isLoading) {
      return const Center(
        child: SizedBox(
          height: 30,
          width: 30,
          child: BtSpinnerWidget(),
        ),
      );
    }

    if (controller.isError) {
      return BtNotificationWidget(
        icon: Icons.error_outline,
        text: StringResource.somethingWrongHasHappened,
        iconSize: 70,
        textButton: StringResource.tryAgain,
        onPress: controller.handleGetProceedings,
      );
    }

    return ListView.builder(
      itemBuilder: (context, index) => ProcedureWidget(
        procedure: controller.proceedings[index],
      ),
      itemCount: controller.proceedings.length,
    );
  }

  Widget _renderContent() {
    return Column(children: <Widget>[
      Container(
        padding: const EdgeInsets.only(top: 25, bottom: 15),
        child: Text(
          'Tramitações',
          style: TextHelper.style(
            fontSize: 20,
            color: BtColorTheme.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      Expanded(child: Obx(() => _renderList())),
      const BtCloseButtonModalWidget(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: (MediaQuery.of(context).size.height * 0.8),
      child: _renderContent(),
    );
  }
}
