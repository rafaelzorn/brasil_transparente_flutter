import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/repositories/deputy_repository.dart';
import 'package:brasil_transparente_flutter/models/deputy_model.dart';
import 'package:brasil_transparente_flutter/helpers/pagination_helper.dart';

class DeputiesController extends GetxController {
  final DeputyRepository _deputyRepository;
  
  final int _itemsPerPage = 15;

  final _deputies = <DeputyModel>[].obs;
  final _pagination = PaginationHelper().obs;
  final _lastPage = false.obs;
  final _isLoading = false.obs;
  final _isError = false.obs;
  final _resetList = false.obs;

  List<DeputyModel> get deputies => _deputies.toList();
  bool get lastPage => _lastPage();
  bool get isLoading => _isLoading();
  bool get isError => _isError();

  int get _page => _pagination().page;

  DeputiesController(this._deputyRepository);

  @override
  void onInit() {
    super.onInit();

    ever(_pagination, (_) => _findDeputies());
    _changePagination(1, showLoading: true);
  }

  Future<void> _findDeputies() async {
    try {
      final deputies = await _deputyRepository.findDeputies(_pagination());

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

    _pagination.update((val) {
      val!.page = page;
      val.items = _itemsPerPage;
    });
  }

  void nextPage() => _changePagination(_page + 1);

  void reload() => _changePagination(_page, showLoading: true);

  Future<void> refresh() async {
    _resetList(true);

    _changePagination(1);
  }
}
