import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/deputy_propositions/controllers/proposition_detail_controller.dart';
import 'package:brasil_transparente_flutter/app/modules/deputy_propositions/pages/widgets/proposition_detail_modal_widget/procedure_widget.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_notification_widget.dart';
import 'package:brasil_transparente_flutter/app/resources/string_resource.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_spinner_widget.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_close_button_modal_widget.dart';
import 'package:brasil_transparente_flutter/app/routes/bt_routes.dart';

class PropositionDetailModalWidget extends StatelessWidget {
  final PropositionDetailController controller;
  final int id;

  const PropositionDetailModalWidget({
    Key? key,
    required this.controller,
    required this.id,
  }) : super(key: key);

  Widget _renderDetailProposition() {
    return Container(
      padding: const EdgeInsets.only(top: 0, bottom: 15),
      child: Column(
        children: <Widget>[
          Text(
            '${controller.proposition.initialsType ?? '-'} ${controller.proposition.number ?? '-'}/${controller.proposition.year ?? '-'}',
            style: TextHelper.style(
              fontSize: 20,
              color: BtColorTheme.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            controller.proposition.menu ?? '-',
            textAlign: TextAlign.center,
            style: TextHelper.style(
              fontSize: 11,
              height: 1.3,
              color: BtColorTheme.slateGray,
            ),
          ),
          const SizedBox(height: 15),
          TextButton(
            onPressed: () => Get.toNamed(BtRoutes.propositionPdf,
                preventDuplicates: false,
                arguments: {
                  'pdf': controller.proposition.fullContent,
                }),
            child: Text(
              StringResource.document,
              style: TextHelper.style(
                fontSize: 11,
                height: 1.3,
                color: BtColorTheme.white,
              ),
            ),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              side: const BorderSide(color: BtColorTheme.slateGray, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderContent() {
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
        onPress: () => controller.handleFindProposition(id: id),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _renderDetailProposition(),
          ...controller.proceedings.map((item) {
            final int index = controller.proceedings.indexOf(item);

            return ProcedureWidget(
              procedure: item,
              isLastUpdate: index == 0,
            );
          }).toList()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 25),
      height: (MediaQuery.of(context).size.height * 0.8),
      child: Column(
        children: <Widget>[
          Expanded(child: Obx(() => _renderContent())),
          const BtCloseButtonModalWidget(),
        ],
      ),
    );
  }
}
