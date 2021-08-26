import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/repositories/state_repository.dart';
import 'package:brasil_transparente_flutter/app/data/models/state_model.dart';

class StatesController extends GetxController {
  static StatesController get to => Get.find();

  final StateRepository _stateRepository;

  final RxList<StateModel> _states = <StateModel>[].obs;
  final RxBool _isLoading = false.obs;
  final RxBool _isError = false.obs;
  final Rx<StateModel> _selectedState = StateModel().obs;

  List<StateModel> get states => _states.toList();
  bool get isLoading => _isLoading();
  bool get isError => _isError();
  StateModel get selectedState => _selectedState();

  StatesController(this._stateRepository);

  @override
  void onInit() {
    super.onInit();

    handleGetStates();
  }


  Future<void> _getStates() async {
    try {
      final List<StateModel> states = await _stateRepository.getStates();

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
