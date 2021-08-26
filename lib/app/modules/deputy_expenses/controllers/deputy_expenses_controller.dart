import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/models/expense_model.dart';
import 'package:brasil_transparente_flutter/app/data/repositories/expense_repository.dart';
import 'package:brasil_transparente_flutter/app/data/supports/find_deputy_expenses_by_year_support.dart';
import 'package:brasil_transparente_flutter/app/modules/deputy_detail/controllers/deputy_detail_controller.dart';

class DeputyExpensesController extends GetxController {
  static DeputyExpensesController get to => Get.find();

  final ExpenseRepository _expenseRepository;

  final String incrementMonth = 'incrementMonth';
  final String decrementMonth = 'decrementMonth';
  final int currentMonthYear = int.parse(Jiffy().format('Myyyy'));

  final RxList<ExpenseModel> _expenses = <ExpenseModel>[].obs;
  final Rx<FindDeputyExpensesByYearSupport> _findDeputyExpensesByYearSupport =
      FindDeputyExpensesByYearSupport().obs;
  final Rx<Jiffy> _currentDate = Jiffy().obs;
  final RxBool _isLoading = false.obs;
  final RxBool _isError = false.obs;

  List<ExpenseModel> get expenses => _expenses.toList();
  int get year => _findDeputyExpensesByYearSupport().year;
  Jiffy get currentDate => _currentDate();
  bool get isLoading => _isLoading();
  bool get isError => _isError();

  DeputyExpensesController(this._expenseRepository);

  @override
  void onInit() {
    super.onInit();

    ever(_findDeputyExpensesByYearSupport, (_) => _findDeputyExpensesByYear());

    handleFindDeputyExpensesByYear(
      year: _currentDate().format('yyyy'),
      isLoading: true,
    );
  }

  Future<void> _findDeputyExpensesByYear() async {
    try {
      final List<ExpenseModel> expenses =
          await _expenseRepository.findDeputyExpensesByYear(
        _findDeputyExpensesByYearSupport(),
      );

      _expenses(expenses);

      _isLoading(false);
      _isError(false);
    } catch (error) {
      _isLoading(false);
      _isError(true);
    }
  }

  void handleFindDeputyExpensesByYear({
    required String year,
    bool isLoading = false,
  }) {
    _isLoading(isLoading);

    _findDeputyExpensesByYearSupport.update((val) {
      val!.year = int.parse(year);
      val.deputyId = DeputyDetailController.to.deputyId;
    });
  }

  ExpenseModel selectedExpenseMonth() {
    return expenses.firstWhere(
      (expense) => expense.month == int.parse(_currentDate().format('M')),
    );
  }

  void reload() {
    handleFindDeputyExpensesByYear(
      year: year.toString(),
      isLoading: true,
    );
  }

  void handleChangeMonth({required String action}) {
    final String yearBeforeChange = _currentDate().format('yyyy');

    if (action == decrementMonth) {
      _currentDate(_currentDate().subtract(months: 1));
    } else {
      _currentDate(_currentDate().add(months: 1));
    }

    if (yearBeforeChange != _currentDate().format('yyyy')) {
      handleFindDeputyExpensesByYear(
        year: _currentDate().format('yyyy'),
        isLoading: true,
      );
    }
  }
}
