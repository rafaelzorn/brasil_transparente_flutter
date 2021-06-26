import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/deputies/controllers/deputies_controller.dart';
import 'package:brasil_transparente_flutter/app/widgets/header_widget.dart';
import 'package:brasil_transparente_flutter/app/resources/strings.dart';
import 'package:brasil_transparente_flutter/app/theme/texts_styles.dart';
import 'package:brasil_transparente_flutter/app/theme/colors.dart';

class DeputiesView extends GetView<DeputiesController> {
  Widget _renderTitle() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          BtStrings.DEPUTIES,
          style: BtTextStyles.titleDeputies,
        ),
      ),
    );
  }

  Widget _renderContent() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          BtHeaderWidget(
            rightIcon: Icons.search,
            rightIconColor: BtColors.TUNDORA,
            rightOnPress: () => {},            
          ),
          _renderTitle()
        ],
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
