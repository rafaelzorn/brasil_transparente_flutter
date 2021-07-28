import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/repositories/state_repository.dart';
import 'package:brasil_transparente_flutter/app/data/models/state_model.dart';

class SelectStateController extends GetxController {
  static SelectStateController get to => Get.find();

  final StateRepository _stateRepository;

  final RxList<StateModel> _states = <StateModel>[].obs;
  final RxBool _isLoading = false.obs;
  final RxBool _isError = false.obs;
  final Rx<StateModel> _selectedState = StateModel().obs;

  List<StateModel> get states => _states.toList();
  bool get isLoading => _isLoading();
  bool get isError => _isError();
  StateModel get selectedState => _selectedState();

  SelectStateController(this._stateRepository);

  Future<void> _getStates() async {
    try {
      final states = await _stateRepository.getStates();

      _states(states);

      _isLoading(false);
      _isError(false);
    } catch (error) {
      _isLoading(false);
      _isError(true);
    }
  }

  void handleGetStates() {
    _isLoading(true);

    _getStates();
  }

  void handleSelectState(StateModel state) {
    _selectedState(state);

    Get.back();
  }

  void clearSelectedState() {
    _selectedState(StateModel());
  }
}
