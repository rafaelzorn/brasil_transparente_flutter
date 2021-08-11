import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/deputy_propositions/controllers/deputy_propositions_controller.dart';
import 'package:brasil_transparente_flutter/app/resources/string_resource.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_main_title_page_widget.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_swipe_calendar_widget.dart';
import 'package:brasil_transparente_flutter/app/modules/deputy_propositions/pages/widgets/proposition_widget.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_spinner_widget.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_notification_widget.dart';

class DeputyPropositionsPage extends GetView<DeputyPropositionsController> {
  const DeputyPropositionsPage({Key? key}) : super(key: key);

  Widget _renderSwipeCalendar() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: BtSwipeCalendarWidget(
        hideRightButton: controller.currentYear == controller.year,
        date: controller.year.toString(),
        onPressedLeft: () => controller.handleChangeYear(
          action: controller.decrementYear,
        ),
        onPressedRight: () => controller.handleChangeYear(
          action: controller.incrementYear,
        ),
      ),
    );
  }

  Widget _renderList() {
    if (controller.isLoading) {
      return const Center(
        child: SizedBox(height: 40, width: 40, child: BtSpinnerWidget()),
      );
    }

    if (controller.isError) {
      return BtNotificationWidget(
        icon: Icons.error_outline,
        text: StringResource.somethingWrongHasHappened,
        textButton: StringResource.tryAgain,
        onPress: controller.reload,
      );
    }

    if (controller.propositions.isEmpty && !controller.isRefresh) {
      return const BtNotificationWidget(
        icon: Icons.sentiment_very_dissatisfied,
        text: StringResource.noResultAvailable,
      );
    }

    return LazyLoadScrollView(
      onEndOfPage: controller.nextPage,
      isLoading: controller.isLastPage,
      child: RefreshIndicator(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return PropositionWidget(
              proposition: controller.propositions[index],
            );
          },
          itemCount: controller.propositions.length,
        ),
        onRefresh: controller.refresh,
      ),
    );
  }

  Widget _renderContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: <Widget>[
          const BtMainTitlePageWidget(title: StringResource.propositions),
          _renderSwipeCalendar(),
          Expanded(child: _renderList()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => _renderContent());
  }
}
