import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/deputies/controllers/deputies_controller.dart';
import 'package:brasil_transparente_flutter/app/modules/deputies/pages/widgets/deputy_widget.dart';
import 'package:brasil_transparente_flutter/app/modules/deputies/pages/widgets/filter_modal_widget/filter_modal_widget.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_header_widget.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_spinner_widget.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_notification_widget.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_modal_widget.dart';
import 'package:brasil_transparente_flutter/app/resources/string_resource.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';

class DeputiesPage extends GetView<DeputiesController> {
  Widget _renderHeader() {
    return BtHeaderWidget(
      rightIcon: Icons.search,
      rightOnPress: () => {
        BtModalWidget.bottomSheet(
          content: FilterModalWidget(),
        )
      },
    );
  }

  Widget _renderTitle() {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          StringResource.DEPUTIES,
          style: TextHelper.style(fontSize: 30, letterSpacing: 2.5),
        ),
      ),
    );
  }

  Widget _renderList() {
    if (controller.isLoading) {
      return Center(
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
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: <Widget>[
            _renderHeader(),
            _renderTitle(),
            Expanded(child: _renderList())
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _renderContent()),
    );
  }
}
