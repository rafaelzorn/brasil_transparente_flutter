import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/deputy_detail/controllers/deputy_detail_controller.dart';
import 'package:brasil_transparente_flutter/app/modules/deputy_expenses/controllers/deputy_expenses_controller.dart';
import 'package:brasil_transparente_flutter/app/data/repositories/expense_repository.dart';
import 'package:brasil_transparente_flutter/app/data/models/expense_model.dart';
import 'package:brasil_transparente_flutter/app/data/supports/find_deputy_expenses_by_month_support.dart';

class ExpensesMonthDetailController extends GetxController {
  static ExpensesMonthDetailController get to => Get.find();

  final ExpenseRepository _expenseRepository;

  final int _itemsPerPage = 15;
  final int initialPage = 1;

  final RxList<ExpenseModel> _expenses = <ExpenseModel>[].obs;
  final Rx<FindDeputyExpensesByMonthSupport> _findDeputyExpensesByMonthSupport =
      FindDeputyExpensesByMonthSupport().obs;
  final RxBool _isLastPage = false.obs;
  final RxBool _isLoading = false.obs;
  final RxBool _isError = false.obs;
  final RxBool _isRefresh = false.obs;

  List<ExpenseModel> get expenses => _expenses.toList();
  bool get lastPage => _isLastPage();
  bool get isLoading => _isLoading();
  bool get isError => _isError();
  bool get isRefresh => _isRefresh();
  int get _page => _findDeputyExpensesByMonthSupport().page;

  ExpensesMonthDetailController(this._expenseRepository);

  @override
  void onInit() {
    super.onInit();

    ever(
      _findDeputyExpensesByMonthSupport,
      (_) => _findDeputyExpensesByMonth(),
    );

    handleFindDeputyExpensesByMonth(
      page: initialPage,
      isLoading: true,
      clearList: true,
    );
  }

  Future<void> _findDeputyExpensesByMonth() async {
    try {
      final Map<String, dynamic> data =
          await _expenseRepository.findDeputyExpensesByMonth(
        _findDeputyExpensesByMonthSupport(),
      );

      if (_isRefresh()) {
        _expenses.clear();
      }

      if (data['last_page']) {
        _isLastPage(true);
      }

      _expenses.addAll(data['expenses']);

      _isLoading(false);
      _isRefresh(false);
      _isError(false);
    } catch (error) {
      _isLoading(false);
      _isRefresh(false);
      _isError(true);
    }
  }

  void handleFindDeputyExpensesByMonth({
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
      _expenses.clear();
    }

    final DeputyExpensesController controller = DeputyExpensesController.to;

    _findDeputyExpensesByMonthSupport.update((val) {
      val!.page = page;
      val.month = int.parse(controller.currentDate.format('M'));
      val.year = int.parse(controller.currentDate.format('yyyy'));
      val.deputyId = DeputyDetailController.to.deputyId;
      val.items = _itemsPerPage;
    });
  }

  @override
  Future<void> refresh() async {
    handleFindDeputyExpensesByMonth(page: initialPage, isRefresh: true);
  }

  void nextPage() {
    if (!_isRefresh() && !_isLastPage()) {
      handleFindDeputyExpensesByMonth(page: _page + initialPage);
    }
  }

  void reload() {
    handleFindDeputyExpensesByMonth(
      page: initialPage,
      isLoading: true,
      clearList: true,
    );
  }
}
