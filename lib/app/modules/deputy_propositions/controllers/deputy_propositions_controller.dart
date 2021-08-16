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
  final RxBool _isLastPage = false.obs;
  final RxBool _isLoading = false.obs;
  final RxBool _isError = false.obs;
  final RxBool _isRefresh = false.obs;

  List<PropositionModel> get propositions => _propositions.toList();
  bool get isLastPage => _isLastPage();
  bool get isLoading => _isLoading();
  bool get isError => _isError();
  bool get isRefresh => _isRefresh();
  int get year => _findPropositionsSupport().year;
  int get _page => _findPropositionsSupport().page;

  DeputyPropositionsController(this._propositionRepository);

  @override
  void onInit() {
    super.onInit();

    ever(_findPropositionsSupport, (_) => _findPropositions());

    handleFindPropositions(
      page: _initialPage,
      year: currentYear,
      isLoading: true,
    );
  }

  Future<void> _findPropositions() async {
    try {
      final Map<String, dynamic> data =
          await _propositionRepository.findPropositions(
        _findPropositionsSupport(),
      );

      if (_isRefresh()) {
        _propositions.clear();
      }

      if (data['last_page']) {
        _isLastPage(true);
      }

      _propositions.addAll(data['propositions']);

      _isLoading(false);
      _isRefresh(false);
      _isError(false);
    } catch (error) {
      _isLoading(false);
      _isRefresh(false);
      _isError(true);
    }
  }

  void handleFindPropositions({
    required int page,
    required int year,
    bool isLoading = false,
    bool isRefresh = false,
    bool isLastPage = false,
    bool clearList = false,
  }) {
    _isLoading(isLoading);
    _isRefresh(isRefresh);
    _isLastPage(isLastPage);

    if (clearList) {
      _propositions.clear();
    }

    _findPropositionsSupport.update((val) {
      val!.page = page;
      val.year = year;
      val.items = _itemsPerPage;
      val.deputyId = int.parse(Get.parameters['id']!);
    });
  }

  @override
  Future<void> refresh() async {
    handleFindPropositions(page: _initialPage, year: year, isRefresh: true);
  }

  void nextPage() {
    if (!_isRefresh() && !_isLastPage()) {
      handleFindPropositions(page: _page + _initialPage, year: year);
    }
  }

  void reload() {
    handleFindPropositions(
      page: _initialPage,
      year: year,
      isLoading: true,
      clearList: true,
    );
  }

  void handleChangeYear({required String action}) {
    int selectedYear = year;

    if (action == decrementYear) {
      selectedYear--;
    } else {
      selectedYear++;
    }

    handleFindPropositions(
      page: _initialPage,
      year: selectedYear,
      isLoading: true,
      clearList: true,
    );
  }
}
