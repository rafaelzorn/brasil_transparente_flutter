import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/deputies/controllers/deputies_controller.dart';
import 'package:brasil_transparente_flutter/app/routes/bt_routes.dart';

class SearchController extends GetxController {  
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  
  void search() {
    Get.offNamed(BtRoutes.DEPUTIES);

    DeputiesController.to.handleFindDeputies(
      page: 1,
      resetList: true,
      showLoading: true,
      filters: {'name': nameController.text},
    );
  }

  void clear() {
    nameController.clear();
  }
}
