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
  final RxBool _isLastPage = false.obs;
  final RxBool _isLoading = false.obs;
  final RxBool _isError = false.obs;
  final RxBool _isRefresh = false.obs;
  final Rx<PoliticalPartyModel> _selectedPoliticalParty =
      PoliticalPartyModel().obs;

  List<PoliticalPartyModel> get politicalParties => _politicalParties.toList();
  PoliticalPartyModel get selectedPoliticalParty => _selectedPoliticalParty();
  bool get lastPage => _isLastPage();
  bool get isLoading => _isLoading();
  bool get isError => _isError();
  bool get isRefresh => _isRefresh();
  int get _page => _getPoliticalPartiesSupport().page;

  SelectPoliticalPartyController(this._politicalPartyRepository);

  @override
  void onInit() {
    super.onInit();

    ever(_getPoliticalPartiesSupport, (_) => _getPoliticalParties());
  }

  Future<void> _getPoliticalParties() async {
    try {
      final Map<String, dynamic> data =
          await _politicalPartyRepository.getPoliticalParties(
        _getPoliticalPartiesSupport(),
      );

      if (_isRefresh()) {
        _politicalParties.clear();
      }

      if (data['last_page']) {
        _isLastPage(true);
      }

      _politicalParties.addAll(data['political_parties']);

      _isLoading(false);
      _isRefresh(false);
      _isError(false);
    } catch (error) {
      _isLoading(false);
      _isRefresh(false);
      _isError(true);
    }
  }

  void handleGetPoliticalParties({
    required int page,
    bool isLoading = false,
    bool isRefresh = false,
    bool isLastPage = false,
    bool clearList = false,
  }) {
    _isLoading(isLoading);
    _isRefresh(isRefresh);
    _isLastPage(isLastPage);

    if (clearList) {
      _politicalParties.clear();
    }

    _getPoliticalPartiesSupport.update((val) {
      val!.page = page;
      val.items = _itemsPerPage;
    });
  }

  @override
  Future<void> refresh() async {
    handleGetPoliticalParties(page: initialPage, isRefresh: true);
  }

  void nextPage() {
    if (!_isRefresh() && !_isLastPage()) {
      handleGetPoliticalParties(page: _page + initialPage);
    }
  }

  void reload() {
    handleGetPoliticalParties(
      page: initialPage,
      isLoading: true,
      clearList: true,
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
