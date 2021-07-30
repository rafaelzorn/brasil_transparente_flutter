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
      margin: EdgeInsets.only(bottom: 25),
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
          SizedBox(height: 5),
          Text(
            '767.745.400-31',
            style: TextHelper.style(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: BtColorTheme.SLATE_GRAY,
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: 200,
            padding: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: BtColorTheme.SLATE_GRAY, width: 1),
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

  Widget _renderContainer(Widget child) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: BtColorTheme.EBONY_CLAY,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: child,
    );
  }

  Widget _renderAbout() {
    return _renderContainer(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sobre',
            style: TextHelper.style(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: BtColorTheme.WHITE,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Jose Abilio Silva De Santana é um deputado brasileiro pelo partido pl, tem 56 anos e nasceu na cidade de Salvador/BA.',
            style: TextHelper.style(
              fontSize: 12,
              color: BtColorTheme.SLATE_GRAY,
              height: 1.3,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  Widget _renderGraduation() {
    return _renderContainer(
      Row(
        children: <Widget>[
          Icon(Icons.school, size: 15, color: BtColorTheme.MELROSE),
          SizedBox(width: 5),
          Text(
            'Graduação: ',
            style: TextHelper.style(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: BtColorTheme.WHITE,
            ),
          ),
          Text(
            'Superior Incompleto',
            style: TextHelper.style(
              fontSize: 12,
              color: BtColorTheme.SLATE_GRAY,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderContact() {
    return _renderContainer(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contato',
            style: TextHelper.style(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: BtColorTheme.WHITE,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Icon(Icons.email, size: 15, color: BtColorTheme.MELROSE),
              SizedBox(width: 5),
              Text(
                'E-mail: ',
                style: TextHelper.style(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: BtColorTheme.WHITE,
                ),
              ),
              Text(
                'DEP.ABILIOSANTANA@CAMARA.LEG.BR'.toLowerCase(),
                style: TextHelper.style(
                  fontSize: 12,
                  color: BtColorTheme.SLATE_GRAY,
                  height: 1.2,
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          Row(
            children: <Widget>[
              Icon(Icons.phone, size: 15, color: BtColorTheme.MELROSE),
              SizedBox(width: 5),
              Text(
                'Telefone: ',
                style: TextHelper.style(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: BtColorTheme.WHITE,
                ),
              ),
              Text(
                '3215-5531',
                style: TextHelper.style(
                  fontSize: 12,
                  color: BtColorTheme.SLATE_GRAY,
                  height: 1.2,
                ),
              ),
            ],
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
                  _renderGraduation(),
                  _renderContact(),
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
