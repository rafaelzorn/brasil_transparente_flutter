import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/deputies/controllers/deputies_controller.dart';
import 'package:brasil_transparente_flutter/app/modules/deputies/pages/widgets/deputy_widget.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_app_bar_widget.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_spinner_widget.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_notification_widget.dart';
import 'package:brasil_transparente_flutter/app/resources/string_resource.dart';
import 'package:brasil_transparente_flutter/app/routes/bt_routes.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_main_title_page_widget.dart';

class DeputiesPage extends GetView<DeputiesController> {
  Widget _renderList() {
    if (controller.isLoading) {
      return Center(
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
        text: StringResource.SOMETHING_WRONG_HAS_HAPPENED,
        textButton: StringResource.TRY_AGAIN,
        onPress: controller.reload,
      );
    }

    if (controller.deputies.length == 0) {
      return BtNotificationWidget(
        icon: Icons.sentiment_very_dissatisfied,
        text: StringResource.NO_RESULTS_AVAILABLE,
      );
    }

    return LazyLoadScrollView(
      onEndOfPage: controller.nextPage,
      isLoading: controller.lastPage,
      child: RefreshIndicator(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return DeputyWidget(deputy: controller.deputies[index]);
          },
          itemCount: controller.deputies.length,
        ),
        onRefresh: controller.refresh,
      ),
    );
  }

  Widget _renderContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          BtMainTitlePageWidget(title: StringResource.DEPUTIES),
          Expanded(child: Obx(() => _renderList())),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BtAppBarWidget(
        rightIcon: Icons.search,
        rightOnPress: () => Get.toNamed(BtRoutes.SEARCH),
      ),
      body: _renderContent(),
    );
  }
}
