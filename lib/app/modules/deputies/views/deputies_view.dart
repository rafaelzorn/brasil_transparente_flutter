import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/deputies/controllers/deputies_controller.dart';
import 'package:brasil_transparente_flutter/app/modules/deputies/views/widgets/deputy/deputy_widget.dart';
import 'package:brasil_transparente_flutter/app/widgets/header/header_widget.dart';
import 'package:brasil_transparente_flutter/app/resources/strings.dart';
import 'package:brasil_transparente_flutter/app/theme/texts_styles.dart';
import 'package:brasil_transparente_flutter/app/theme/colors.dart';

class DeputiesView extends GetView<DeputiesController> {
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
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => _renderDeputy(
          context: context,
          index: index,
        ),
        itemCount: controller.deputies.length,
      ),
    );
  }

  Widget _renderDeputy({required BuildContext context, required int index}) {
    return DeputyWidget();
  }

  Widget _renderContent() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: <Widget>[
            _renderHeader(),
            _renderTitle(),
            _renderList(),
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
