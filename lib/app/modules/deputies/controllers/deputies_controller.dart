import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/repositories/deputy_repository.dart';
import 'package:brasil_transparente_flutter/app/data/models/deputy_model.dart';
import 'package:brasil_transparente_flutter/app/data/supports/find_deputies_support.dart';

class DeputiesController extends GetxController {
  static DeputiesController get to => Get.find();

  final DeputyRepository _deputyRepository;

  final int _itemsPerPage = 15;
  final int _initialPage = 1;

  final RxList<DeputyModel> _deputies = <DeputyModel>[].obs;
  final Rx<FindDeputiesSupport> _findDeputiesSupport =
      FindDeputiesSupport().obs;
  final RxBool _lastPage = false.obs;
  final RxBool _isLoading = false.obs;
  final RxBool _isError = false.obs;
  final RxBool _resetList = false.obs;

  List<DeputyModel> get deputies => _deputies.toList();
  bool get lastPage => _lastPage();
  bool get isLoading => _isLoading();
  bool get isError => _isError();

  int get _page => _findDeputiesSupport().page;
  String get name => _findDeputiesSupport().name;

  DeputiesController(this._deputyRepository);

  @override
  void onInit() {
    super.onInit();

    ever(_findDeputiesSupport, (_) => _findDeputies());
    handleFindDeputies(page: _initialPage, showLoading: true);
  }

  Future<void> _findDeputies() async {
    try {
      final deputies = await _deputyRepository.findDeputies(
        _findDeputiesSupport(),
      );

      if (_resetList()) {
        _deputies.clear();
      }

      _deputies.addAll(deputies);

      _isLoading(false);
      _resetList(false);
      _isError(false);
    } catch (error) {
      _isLoading(false);
      _resetList(false);
      _isError(true);
    }
  }

  void handleFindDeputies({
    required int page,
    bool showLoading = false,
    resetList = false,
    String name = '',
  }) {
    _resetList(resetList);
    _isLoading(showLoading);

    _findDeputiesSupport.update((val) {
      val!.page = page;
      val.items = _itemsPerPage;
      val.name = name;
    });
  }

  Future<void> refresh() async {
    handleFindDeputies(page: _initialPage, resetList: true, name: name);
  }

  void nextPage() => handleFindDeputies(page: _page + _initialPage, name: name);

  void reload() {
    handleFindDeputies(page: _page, showLoading: true, name: name);
  }
}
