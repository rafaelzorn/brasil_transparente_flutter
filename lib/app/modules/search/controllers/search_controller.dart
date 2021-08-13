import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/deputies/controllers/deputies_controller.dart';
import 'package:brasil_transparente_flutter/app/modules/search/controllers/states_controller.dart';
import 'package:brasil_transparente_flutter/app/modules/search/controllers/political_parties_controller.dart';

class SearchController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();

  SearchController();

  void search() {
    Get.back();

    final Map<String, String> filters = {
      'name': nameController.text,
      'siglaUf': StatesController.to.selectedState.initials ?? '',
      'siglaPartido':
          PoliticalPartiesController.to.selectedPoliticalParty.initials ??
              '',
    };

    DeputiesController.to.handleFindDeputies(
      page: DeputiesController.to.initialPage,
      isLoading: true,
      clearList: true,
      filters: filters,
    );
  }

  void clear() {
    nameController.clear();
    StatesController.to.clearSelectedState();
    PoliticalPartiesController.to.clearPoliticalParty();
  }
}
