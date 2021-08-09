import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/repositories/political_party_repository.dart';
import 'package:brasil_transparente_flutter/app/data/models/political_party_model.dart';
import 'package:brasil_transparente_flutter/app/data/supports/get_political_parties_support.dart';

class SelectPoliticalPartyController extends GetxController {
  static SelectPoliticalPartyController get to => Get.find();

  final PoliticalPartyRepository _politicalPartyRepository;

  final int _itemsPerPage = 15;
  final int initialPage = 1;

  final RxList<PoliticalPartyModel> _politicalParties =
      <PoliticalPartyModel>[].obs;
  final Rx<GetPoliticalPartiesSupport> _getPoliticalPartiesSupport =
      GetPoliticalPartiesSupport().obs;
  final RxBool _lastPage = false.obs;
  final RxBool _isLoading = false.obs;
  final RxBool _isError = false.obs;
  final RxBool _resetList = false.obs;
  final Rx<PoliticalPartyModel> _selectedPoliticalParty =
      PoliticalPartyModel().obs;

  List<PoliticalPartyModel> get politicalParties => _politicalParties.toList();
  PoliticalPartyModel get selectedPoliticalParty => _selectedPoliticalParty();
  bool get lastPage => _lastPage();
  bool get isLoading => _isLoading();
  bool get isError => _isError();

  int get _page => _getPoliticalPartiesSupport().page;

  SelectPoliticalPartyController(this._politicalPartyRepository);

  @override
  void onInit() {
    super.onInit();

    ever(_getPoliticalPartiesSupport, (_) => _getPoliticalParties());
  }

  Future<void> _getPoliticalParties() async {
    try {
      final List<PoliticalPartyModel> politicalParties =
          await _politicalPartyRepository.getPoliticalParties(
        _getPoliticalPartiesSupport(),
      );

      if (_resetList()) {
        _politicalParties.clear();
        _lastPage(false);
        _resetList(false);
      }

      if (politicalParties.isEmpty) {
        _lastPage(true);
      }

      _politicalParties.addAll(politicalParties);

      _isLoading(false);
      _isError(false);
    } catch (error) {
      _isLoading(false);
      _isError(true);
    }
  }

  void handleGetPoliticalParties({
    required int page,
    bool showLoading = false,
    resetList = false,
  }) {
    _resetList(resetList);
    _isLoading(showLoading);

    _getPoliticalPartiesSupport.update((val) {
      val!.page = page;
      val.items = _itemsPerPage;
    });
  }

  @override
  Future<void> refresh() async {
    handleGetPoliticalParties(page: initialPage, resetList: true);
  }

  void nextPage() {
    handleGetPoliticalParties(page: _page + initialPage);
  }

  void reload() {     
    handleGetPoliticalParties(
      page: _page,
      showLoading: true,
      resetList: _resetList(),
    );
  }

  void handleSelectPoliticalParty(PoliticalPartyModel politicalParty) {
    _selectedPoliticalParty(politicalParty);

    Get.back();
  }

  void clearPoliticalParty() {
    _selectedPoliticalParty(PoliticalPartyModel());
  }
}
