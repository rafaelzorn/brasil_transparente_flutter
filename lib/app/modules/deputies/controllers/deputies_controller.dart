import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/repositories/deputy_repository.dart';
import 'package:brasil_transparente_flutter/app/data/models/deputy_model.dart';
import 'package:brasil_transparente_flutter/app/data/supports/pagination_support.dart';

class DeputiesController extends GetxController {
  final DeputyRepository _deputyRepository;

  final int _itemsPerPage = 15;
  final int _initialPage = 1;

  final RxList<DeputyModel> _deputies = <DeputyModel>[].obs;
  final Rx<PaginationSupport> _paginationSupport = PaginationSupport().obs;  
  final RxBool _lastPage = false.obs;
  final RxBool _isLoading = false.obs;
  final RxBool _isError = false.obs;
  final RxBool _resetList = false.obs;

  List<DeputyModel> get deputies => _deputies.toList();
  bool get lastPage => _lastPage();
  bool get isLoading => _isLoading();
  bool get isError => _isError();

  int get _page => _paginationSupport().page;

  DeputiesController(this._deputyRepository);
  
  @override
  void onInit() {
    super.onInit();

    ever(_paginationSupport, (_) => _findDeputies());
    _changePagination(1, showLoading: true);
  }

  Future<void> _findDeputies() async {
    try {
      final deputies = await _deputyRepository.findDeputies(
        _paginationSupport(),
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

  void _changePagination(int page, {bool showLoading = false}) {
    _isLoading(showLoading);

    _paginationSupport.update((val) {
      val!.page = page;
      val.items = _itemsPerPage;
    });
  }

  Future<void> refresh() async {
    _resetList(true);

    _changePagination(_initialPage);
  }

  void nextPage() => _changePagination(_page + _initialPage);

  void reload() => _changePagination(_page, showLoading: true);
}
