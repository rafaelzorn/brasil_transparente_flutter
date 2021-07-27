import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/deputies/controllers/deputies_controller.dart';
import 'package:brasil_transparente_flutter/app/data/repositories/state_repository.dart';
import 'package:brasil_transparente_flutter/app/data/models/state_model.dart';

class SearchController extends GetxController {
  final StateRepository _stateRepository;

  final RxList<StateModel> _states = <StateModel>[].obs;
  final RxBool _statesIsLoading = false.obs;
  final RxBool _statesIsError = false.obs;
  final Rx<StateModel> _selectedState = StateModel().obs;

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();

  List<StateModel> get states => _states.toList();
  bool get statesIsLoading => _statesIsLoading();
  bool get statesIsError => _statesIsError();
  StateModel get selectedState => _selectedState();

  SearchController(this._stateRepository);

  void search() {
    Get.back();

    DeputiesController.to.handleFindDeputies(
      page: 1,
      resetList: true,
      showLoading: true,
      filters: {
        'name': nameController.text,
        'siglaUf': selectedState.initials ?? '',
      },
    );
  }

  void clear() {
    nameController.clear();
    _selectedState(StateModel());
  }

  Future<void> _getStates() async {
    try {
      final states = await _stateRepository.getStates();

      _states(states);

      _statesIsLoading(false);
      _statesIsError(false);
    } catch (error) {
      _statesIsLoading(false);
      _statesIsError(true);
    }
  }

  void handleGetStates() {
    _statesIsLoading(true);

    _getStates();
  }

  void handleSelectState(StateModel state) {
    _selectedState(state);

    Get.back();
  }
}
