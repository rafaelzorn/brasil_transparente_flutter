import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/widgets/bt_app_bar_widget.dart';
import 'package:brasil_transparente_flutter/app/modules/deputy_detail/controllers/deputy_detail_controller.dart';
import 'package:brasil_transparente_flutter/app/modules/deputy_profile/pages/deputy_profile_page.dart';
import 'package:brasil_transparente_flutter/app/modules/deputy_expenses/pages/deputy_expenses_page.dart';
import 'package:brasil_transparente_flutter/app/modules/deputy_propositions/pages/deputy_propositions_page.dart';
import 'package:brasil_transparente_flutter/app/resources/string_resource.dart';

class DeputyDetailPage extends GetView<DeputyDetailController> {
  const DeputyDetailPage({Key? key}) : super(key: key);

  Widget _renderContent() {
    return IndexedStack(
      index: controller.indexStack,
      children: const <Widget>[
        DeputyProfilePage(),
        DeputyExpensesPage(),
        DeputyPropositionsPage(),
      ],
    );
  }

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BtAppBarWidget(
        leftIcon: Icons.chevron_left,
        leftOnPress: () => Get.back(),
      ),
      body: Obx(() => _renderContent()),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: controller.handleIndexStack,
          currentIndex: controller.indexStack,
          iconSize: 20,
          elevation: 0,
          items: [
            _bottomNavigationBarItem(
              icon: Icons.person,
              label: StringResource.profile,
            ),
            _bottomNavigationBarItem(
              icon: Icons.attach_money,
              label: StringResource.expenses,
            ),
            _bottomNavigationBarItem(
              icon: Icons.description,
              label: StringResource.propositions,
            ),
          ],
        ),
      ),
    );
  }
}
