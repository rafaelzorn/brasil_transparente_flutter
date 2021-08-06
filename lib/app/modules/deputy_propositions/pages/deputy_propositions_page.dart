import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/deputy_propositions/controllers/deputy_propositions_controller.dart';
import 'package:brasil_transparente_flutter/app/resources/string_resource.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_main_title_page_widget.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_swipe_calendar_widget.dart';

class DeputyPropositionsPage extends GetView<DeputyPropositionsController> {
  Widget _renderContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          BtMainTitlePageWidget(
            title: StringResource.PROPOSITIONS,
            marginBottom: 30,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: BtSwipeCalendarWidget(date: '2021'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _renderContent();
  }
}
