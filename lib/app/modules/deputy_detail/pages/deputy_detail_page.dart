import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/deputy_detail/controllers/deputy_detail_controller.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_header_widget.dart';
import 'package:brasil_transparente_flutter/app/modules/deputy_detail/pages/widgets/profile_image_widget.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';

class DeputyDetailPage extends GetView<DeputyDetailController> {
  Widget _renderHeader() {
    return BtHeaderWidget(
      leftIcon: Icons.chevron_left,
      leftOnPress: () => Get.back(),
    );
  }

  Widget _renderMainInformation() {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        children: <Widget>[
          Text(
            'Abílio Santana',
            style: TextHelper.style(
              fontSize: 21,
              fontWeight: FontWeight.w600,
              color: BtColorTheme.WHITE,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '767.745.400-31',
            style: TextHelper.style(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: BtColorTheme.SILVER,
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 90),
            decoration: BoxDecoration(
              color: BtColorTheme.DODGER_BLUE,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Text(
              'PT',
              style: TextHelper.style(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: BtColorTheme.WHITE,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderAbout() {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: BtColorTheme.CHARADE,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sobre',
            style: TextHelper.style(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: BtColorTheme.WHITE,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Jose Abilio Silva De Santana é um deputado brasileiro pelo partido pl, tem 56 anos e nasceu na cidade de Salvador/BA.',
            style: TextHelper.style(
              fontSize: 13,
              color: BtColorTheme.WHITE,
              height: 1.2,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  Widget _renderContent() {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            _renderHeader(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: <Widget>[
                  ProfileImageWidget(),
                  _renderMainInformation(),
                  _renderAbout(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _renderContent());
  }
}
