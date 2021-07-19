import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';

class BtModalWidget {
  static void bottomSheet({required Widget content}) {
    Get.bottomSheet(
      content,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      backgroundColor: BtColorTheme.CINDER,
      isDismissible: true,
      isScrollControlled: true,
    );
  }
}
