import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/repositories/proposition_repository.dart';
import 'package:brasil_transparente_flutter/app/data/models/proposition_model.dart';
import 'package:brasil_transparente_flutter/app/data/supports/find_propositions_support.dart';
import 'package:brasil_transparente_flutter/app/helpers/date_helper.dart';

class DeputyPropositionsController extends GetxController {
  final PropositionRepository _propositionRepository;

  final int _itemsPerPage = 15;
  final int _initialPage = 1;
  final int currentYear = DateHelper.currentYear();

  final String incrementYear = 'incrementYear';
  final String decrementYear = 'decrementYear';

  final RxList<PropositionModel> _propositions = <PropositionModel>[].obs;
  final Rx<FindPropositionsSupport> _findPropositionsSupport =
      FindPropositionsSupport().obs;
  final RxBool _lastPage = false.obs;
  final RxBool _isLoading = false.obs;
  final RxBool _isError = false.obs;
  final RxBool _resetList = false.obs;

  List<PropositionModel> get propositions => _propositions.toList();
  bool get lastPage => _lastPage();
  bool get isLoading => _isLoading();
  bool get isError => _isError();

  int get _page => _findPropositionsSupport().page;
  int get year => _findPropositionsSupport().year;

  DeputyPropositionsController(this._propositionRepository);

  @override
  void onInit() {
    super.onInit();

    ever(_findPropositionsSupport, (_) => _findPropositions());

    handleFindPropositions(
      page: _initialPage,
      showLoading: true,
      year: currentYear,
    );
  }

  Future<void> _findPropositions() async {
    try {
      final List<PropositionModel> propositions =
          await _propositionRepository.findPropositions(
        _findPropositionsSupport(),
      );

      if (_resetList()) {
        _propositions.clear();
        _lastPage(false);
        _resetList(false);
      }

      if (propositions.isEmpty || propositions.length < _itemsPerPage) {
        _lastPage(true);
      }

      _propositions.addAll(propositions);

      _isLoading(false);
      _isError(false);
    } catch (error) {
      _isLoading(false);
      _isError(true);
    }
  }

  void handleFindPropositions({
    required int page,
    required int year,
    bool showLoading = false,
    resetList = false,
  }) {
    _resetList(resetList);
    _isLoading(showLoading);

    _findPropositionsSupport.update((val) {
      val!.page = page;
      val.year = year;
      val.items = _itemsPerPage;
      val.deputyId = int.parse(Get.parameters['id']!);
    });
  }

  @override
  Future<void> refresh() async {
    handleFindPropositions(page: _initialPage, resetList: true, year: year);
  }

  void nextPage() {
    handleFindPropositions(page: _page + _initialPage, year: year);
  }

  void reload() {
    handleFindPropositions(
      page: _page,
      showLoading: true,
      resetList: _resetList(),
      year: year,
    );
  }

  void handleChangeYear({required String action}) {
    _resetList(true);
    _isLoading(true);

    _findPropositionsSupport.update((val) {
      int selectedYear = val!.year;

      if (action == decrementYear) {
        selectedYear--;
      } else {
        selectedYear++;
      }

      val.page = _initialPage;
      val.year = selectedYear;
    });
  }
}
