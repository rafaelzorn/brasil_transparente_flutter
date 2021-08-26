import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/deputy_profile/controllers/deputy_profile_controller.dart';
import 'package:brasil_transparente_flutter/app/modules/deputy_profile/pages/widgets/profile_image_widget.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_spinner_widget.dart';
import 'package:brasil_transparente_flutter/app/helpers/string_helper.dart';
import 'package:brasil_transparente_flutter/app/helpers/format_helper.dart';
import 'package:brasil_transparente_flutter/app/helpers/deputy_helper.dart';
import 'package:brasil_transparente_flutter/app/resources/string_resource.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_notification_widget.dart';

class DeputyProfilePage extends GetView<DeputyProfileController> {
  const DeputyProfilePage({Key? key}) : super(key: key);

  Widget _renderMainInformation() {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: Column(
        children: <Widget>[
          Text(
            StringHelper.capitalize(
              controller.deputy.name ?? '-',
              allWords: true,
            ),
            style: TextHelper.style(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: BtColorTheme.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            FormatHelper.formatCpf(controller.deputy.cpf),
            style: TextHelper.style(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: BtColorTheme.slateGray,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 180,
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(color: BtColorTheme.slateGray, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(30)),
            ),
            child: Text(
              controller.deputy.initialsParty ?? '-',
              style: TextHelper.style(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: BtColorTheme.white,
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
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: BtColorTheme.ebonyClay,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: child,
    );
  }

  Widget _renderAbout() {
    return _renderBox(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            StringResource.about,
            style: TextHelper.style(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: BtColorTheme.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            DeputyHelper.about(controller.deputy),
            style: TextHelper.style(
              fontSize: 12,
              color: BtColorTheme.slateGray,
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
          const Icon(Icons.school, size: 15, color: BtColorTheme.melrose),
          const SizedBox(width: 5),
          Text(
            '${StringResource.graduation}: ',
            style: TextHelper.style(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: BtColorTheme.white,
            ),
          ),
          Text(
            controller.deputy.schooling ?? '-',
            style: TextHelper.style(
              fontSize: 12,
              color: BtColorTheme.slateGray,
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
        children: <Widget>[
          Text(
            StringResource.contact,
            style: TextHelper.style(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: BtColorTheme.white,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: <Widget>[
              const Icon(Icons.email, size: 15, color: BtColorTheme.melrose),
              const SizedBox(width: 5),
              Text(
                '${StringResource.email}: ',
                style: TextHelper.style(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: BtColorTheme.white,
                ),
              ),
              Text(
                controller.deputy.email ?? '-',
                style: TextHelper.style(
                  fontSize: 12,
                  color: BtColorTheme.slateGray,
                  height: 1.2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: <Widget>[
              const Icon(Icons.phone, size: 15, color: BtColorTheme.melrose),
              const SizedBox(width: 5),
              Text(
                '${StringResource.phone}: ',
                style: TextHelper.style(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: BtColorTheme.white,
                ),
              ),
              Text(
                controller.deputy.phone ?? '-',
                style: TextHelper.style(
                  fontSize: 12,
                  color: BtColorTheme.slateGray,
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
      return const Center(
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
        text: StringResource.somethingWrongHasHappened,
        textButton: StringResource.tryAgain,
        onPress: controller.reload,
      );
    }

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: <Widget>[
            const ProfileImageWidget(),
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
    return Obx(() => _renderContent());
  }
}
