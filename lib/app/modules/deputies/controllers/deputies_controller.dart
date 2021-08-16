import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/repositories/deputy_repository.dart';
import 'package:brasil_transparente_flutter/app/data/models/deputy_model.dart';
import 'package:brasil_transparente_flutter/app/data/supports/find_deputies_support.dart';

class DeputiesController extends GetxController {
  static DeputiesController get to => Get.find();

  final DeputyRepository _deputyRepository;

  final int _itemsPerPage = 15;
  final int initialPage = 1;

  final RxList<DeputyModel> _deputies = <DeputyModel>[].obs;
  final Rx<FindDeputiesSupport> _findDeputiesSupport =
      FindDeputiesSupport().obs;
  final RxBool _isLastPage = false.obs;
  final RxBool _isLoading = false.obs;
  final RxBool _isError = false.obs;
  final RxBool _isRefresh = false.obs;

  List<DeputyModel> get deputies => _deputies.toList();
  bool get isLastPage => _isLastPage();
  bool get isLoading => _isLoading();
  bool get isError => _isError();
  bool get isRefresh => _isRefresh();
  int get _page => _findDeputiesSupport().page;
  Map<String, String> get filters => _findDeputiesSupport().filters;

  DeputiesController(this._deputyRepository);

  @override
  void onInit() {
    super.onInit();

    ever(_findDeputiesSupport, (_) => _findDeputies());
    handleFindDeputies(page: initialPage, isLoading: true);
  }

  Future<void> _findDeputies() async {
    try {
      final Map<String, dynamic> data = await _deputyRepository.findDeputies(
        _findDeputiesSupport(),
      );

      if (_isRefresh()) {
        _deputies.clear();
      }

      if (data['last_page']) {
        _isLastPage(true);
      }

      _deputies.addAll(data['deputies']);

      _isLoading(false);
      _isRefresh(false);
      _isError(false);
    } catch (error) {
      _isLoading(false);
      _isRefresh(false);
      _isError(true);
    }
  }

  void handleFindDeputies({
    required int page,
    Map<String, String> filters = const {},
    bool isLoading = false,
    bool isRefresh = false,
    bool isLastPage = false,
    bool clearList = false,
  }) {
    _isLoading(isLoading);
    _isRefresh(isRefresh);
    _isLastPage(isLastPage);

    if (clearList) {
      _deputies.clear();
    }

    _findDeputiesSupport.update((val) {
      val!.page = page;
      val.items = _itemsPerPage;
      val.filters = filters;
    });
  }

  @override
  Future<void> refresh() async {
    handleFindDeputies(page: initialPage, isRefresh: true, filters: filters);
  }

  void nextPage() {
    if (!_isRefresh() && !_isLastPage()) {
      handleFindDeputies(page: _page + initialPage, filters: filters);
    }
  }

  void reload() {
    handleFindDeputies(
      page: initialPage,
      isLoading: true,
      clearList: true,
      filters: filters,
    );
  }
}
