import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

// Bt
import 'package:brasil_transparente_flutter/modules/deputies/controllers/deputies_controller.dart';
import 'package:brasil_transparente_flutter/modules/deputies/views/widgets/deputy/deputy_widget.dart';
import 'package:brasil_transparente_flutter/widgets/header/header_widget.dart';
import 'package:brasil_transparente_flutter/widgets/spinner/spinner_widget.dart';
import 'package:brasil_transparente_flutter/widgets/notification/notification_widget.dart';
import 'package:brasil_transparente_flutter/resources/strings.dart';
import 'package:brasil_transparente_flutter/themes/texts_styles.dart';
import 'package:brasil_transparente_flutter/themes/colors.dart';

class DeputiesView extends StatelessWidget {
  final DeputiesController _controller;

  const DeputiesView(this._controller, {Key? key}) : super(key: key);

  Widget _renderHeader() {
    return BtHeaderWidget(
      rightIcon: Icons.search,
      rightIconColor: BtColors.TUNDORA,
      rightOnPress: () => {},
    );
  }

  Widget _renderTitle() {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          BtStrings.DEPUTIES,
          style: BtTextStyles.titleDeputies,
        ),
      ),
    );
  }

  Widget _renderList() {
    if (_controller.isLoading) {
      return Center(
        child: SizedBox(
          height: 30,
          width: 30,
          child: BtSpinnerWidget(),
        ),
      );
    }

    if (_controller.isError) {
      return BtNotificationWidget(
        icon: Icons.error_outline,
        text: BtStrings.SOMETHING_WRONG_HAS_HAPPENED,
        textButton: BtStrings.TRY_AGAIN,
        onPress: _controller.reload,
      );
    }

    if (_controller.deputies.length == 0) {
      return BtNotificationWidget(
        icon: Icons.sentiment_very_dissatisfied,
        text: BtStrings.NO_RESULTS_AVAILABLE,
      );
    }

    return LazyLoadScrollView(
      onEndOfPage: _controller.nextPage,
      isLoading: _controller.lastPage,
      child: RefreshIndicator(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return DeputyWidget(deputy: _controller.deputies[index]);
          },
          itemCount: _controller.deputies.length,
        ),
        onRefresh: _controller.refresh,
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
            Expanded(child: Obx(() => _renderList()))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _renderContent(),
    );
  }
}
