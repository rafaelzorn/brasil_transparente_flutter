import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/deputies/controllers/deputies_controller.dart';
import 'package:brasil_transparente_flutter/app/modules/search/controllers/select_state_controller.dart';
import 'package:brasil_transparente_flutter/app/modules/search/controllers/select_political_party_controller.dart';

class SearchController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();

  SearchController();

  void search() {
    Get.back();

    DeputiesController.to.handleFindDeputies(
      page: 1,
      resetList: true,
      showLoading: true,
      filters: {
        'name': nameController.text,
        'siglaUf': SelectStateController.to.selectedState.initials ?? '',
        'siglaPartido':
            SelectPoliticalPartyController.to.selectedPoliticalParty.initials ??
                '',
      },
    );
  }

  void clear() {
    nameController.clear();
    SelectStateController.to.clearSelectedState();
    SelectPoliticalPartyController.to.clearPoliticalParty();
  }
}
