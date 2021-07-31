import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/deputy_detail/controllers/deputy_detail_controller.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_app_bar_widget.dart';
import 'package:brasil_transparente_flutter/app/modules/deputy_detail/pages/widgets/profile_image_widget.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_spinner_widget.dart';
import 'package:brasil_transparente_flutter/app/helpers/string_helper.dart';
import 'package:brasil_transparente_flutter/app/helpers/format_helper.dart';
import 'package:brasil_transparente_flutter/app/helpers/deputy_helper.dart';
import 'package:brasil_transparente_flutter/app/resources/string_resource.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_notification_widget.dart';

class DeputyDetailPage extends GetView<DeputyDetailController> {
  Widget _renderMainInformation() {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: Column(
        children: <Widget>[
          Text(
            StringHelper.capitalize(
              controller.deputy.name ?? '-',
              allWords: true,
            ),
            style: TextHelper.style(
              fontSize: 21,
              fontWeight: FontWeight.w600,
              color: BtColorTheme.WHITE,
            ),
          ),
          SizedBox(height: 5),
          Text(
            FormatHelper.formatCpf(controller.deputy.cpf),
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
              controller.deputy.initialsParty ?? '-',
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

  Widget _renderBox(Widget child) {
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
    return _renderBox(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringResource.ABOUT,
            style: TextHelper.style(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: BtColorTheme.WHITE,
            ),
          ),
          SizedBox(height: 10),
          Text(
            DeputyHelper.about(controller.deputy),
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
    return _renderBox(
      Row(
        children: <Widget>[
          Icon(Icons.school, size: 15, color: BtColorTheme.MELROSE),
          SizedBox(width: 5),
          Text(
            '${StringResource.GRADUATION}: ',
            style: TextHelper.style(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: BtColorTheme.WHITE,
            ),
          ),
          Text(
            controller.deputy.schooling ?? '-',
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
    return _renderBox(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringResource.CONTACT,
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
                '${StringResource.EMAIL}: ',
                style: TextHelper.style(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: BtColorTheme.WHITE,
                ),
              ),
              Text(
                controller.deputy.email ?? '-',
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
                '${StringResource.PHONE}: ',
                style: TextHelper.style(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: BtColorTheme.WHITE,
                ),
              ),
              Text(
                controller.deputy.phone ?? '-',
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

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: <Widget>[
            ProfileImageWidget(
              photo: controller.deputy.photo,
              situation: controller.deputy.situation,
            ),
            _renderMainInformation(),
            _renderAbout(),
            _renderGraduation(),
            _renderContact(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BtAppBarWidget(
        leftIcon: Icons.chevron_left,
        leftOnPress: () => Get.back(),
      ),
      body: Obx(() => _renderContent()),
    );
  }
}
