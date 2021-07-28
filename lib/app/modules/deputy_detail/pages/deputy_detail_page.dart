import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/deputy_detail/controllers/deputy_detail_controller.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_header_widget.dart';
import 'package:brasil_transparente_flutter/app/modules/deputy_detail/pages/widgets/profile_image_widget.dart';

class DeputyDetailPage extends GetView<DeputyDetailController> {
  Widget _renderHeader() {
    return BtHeaderWidget(
      leftIcon: Icons.chevron_left,
      leftOnPress: () => Get.back(),
    );
  }

  Widget _renderContent() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          _renderHeader(),
          Container(
            child: Column(
              children: <Widget>[ProfileImageWidget()],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _renderContent());
  }
}
