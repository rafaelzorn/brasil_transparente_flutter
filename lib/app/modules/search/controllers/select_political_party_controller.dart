import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/repositories/political_party_repository.dart';
import 'package:brasil_transparente_flutter/app/data/models/political_party_model.dart';

class SelectPoliticalPartyController extends GetxController {
  static SelectPoliticalPartyController get to => Get.find();

  final PoliticalPartyRepository _politicalPartyRepository;

  final RxList<PoliticalPartyModel> _politicalParties =
      <PoliticalPartyModel>[].obs;
  final RxBool _isLoading = false.obs;
  final RxBool _isError = false.obs;
  final Rx<PoliticalPartyModel> _selectedPoliticalParty =
      PoliticalPartyModel().obs;

  List<PoliticalPartyModel> get politicalParties => _politicalParties.toList();
  bool get isLoading => _isLoading();
  bool get isError => _isError();
  PoliticalPartyModel get selectedPoliticalParty => _selectedPoliticalParty();

  SelectPoliticalPartyController(this._politicalPartyRepository);

  Future<void> _getPoliticalParties() async {
    try {
      final politicalParties =
          await _politicalPartyRepository.getPoliticalParties();

      _politicalParties(politicalParties);

      _isLoading(false);
      _isError(false);
    } catch (error) {
      _isLoading(false);
      _isError(true);
    }
  }

  void handleGetPoliticalParties() {
    _isLoading(true);

    _getPoliticalParties();
  }

  void handleSelectPoliticalParty(PoliticalPartyModel politicalParty) {
    _selectedPoliticalParty(politicalParty);

    Get.back();
  }

  void clearPoliticalParty() {
    _selectedPoliticalParty(PoliticalPartyModel());
  }
}
