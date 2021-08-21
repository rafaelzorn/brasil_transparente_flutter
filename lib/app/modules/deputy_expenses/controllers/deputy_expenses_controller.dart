import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/models/expense_model.dart';
import 'package:brasil_transparente_flutter/app/data/repositories/expense_repository.dart';
import 'package:brasil_transparente_flutter/app/data/supports/find_deputy_expenses_support.dart';

class DeputyExpensesController extends GetxController {
  final ExpenseRepository _expenseRepository;

  final String incrementYear = 'incrementYear';
  final String decrementYear = 'decrementYear';
  final int currentMonth = int.parse(Jiffy().format('yyyyM'));

  final RxList<ExpenseModel> _expensesByYear = <ExpenseModel>[].obs;
  final Rx<FindDeputyExpensesSupport> _findDeputyExpensesSupport =
      FindDeputyExpensesSupport().obs;
  final Rx<Jiffy> _currentDate = Jiffy().obs;
  final RxBool _loadExpensesByYear = false.obs;
  final RxBool _isLoading = false.obs;
  final RxBool _isError = false.obs;

  List<ExpenseModel> get expensesByYear => _expensesByYear.toList();
  Jiffy get currentDate => _currentDate();
  int get year => _findDeputyExpensesSupport().year;
  int get deputyId => _findDeputyExpensesSupport().deputyId;
  bool get isLoading => _isLoading();
  bool get loadExpensesByYear => _loadExpensesByYear();
  bool get isError => _isError();

  DeputyExpensesController(this._expenseRepository);

  @override
  void onInit() {
    super.onInit();

    ever(_findDeputyExpensesSupport, (_) => _findDeputyExpenses());

    _loadExpensesByYear(true);

    handlefindDeputyExpenses(
      month: int.parse(_currentDate().format('M')),
      year: int.parse(_currentDate().format('yyyy')),
      isLoading: true,
    );
  }

  Future<void> _findDeputyExpenses() async {
    try {
      if (_loadExpensesByYear()) {
        _handleExpensesByYear();
      }

      _isLoading(false);
      _isError(false);
    } catch (error) {
      _isLoading(false);
      _isError(true);
    }
  }

  Future<void> _handleExpensesByYear() async {
    final List<ExpenseModel> expensesByYear =
        await _expenseRepository.findDeputyExpensesByYear(
      _findDeputyExpensesSupport(),
    );

    _expensesByYear(expensesByYear);
    _loadExpensesByYear(false);
  }

  void handleChangeMonth({required String action}) {
    final String oldYear = _currentDate().format('yyyy');

    if (action == decrementYear) {
      _currentDate(_currentDate().subtract(months: 1));
    } else {
      _currentDate(_currentDate().add(months: 1));
    }

    if (oldYear != _currentDate().format('yyyy')) {
      _loadExpensesByYear(true);
    }

    handlefindDeputyExpenses(
      month: int.parse(_currentDate().format('M')),
      year: int.parse(_currentDate().format('yyyy')),
      isLoading: true,
    );
  }

  void handlefindDeputyExpenses({
    required int month,
    required int year,
    bool isLoading = false,
  }) {
    _isLoading(isLoading);

    _findDeputyExpensesSupport.update((val) {
      val!.month = month;
      val.year = year;
      val.deputyId = int.parse(Get.parameters['id']!);
    });
  }
}
