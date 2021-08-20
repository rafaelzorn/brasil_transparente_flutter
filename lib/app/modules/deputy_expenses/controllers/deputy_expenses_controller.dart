import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/models/expense_model.dart';
import 'package:brasil_transparente_flutter/app/data/repositories/expense_repository.dart';
import 'package:brasil_transparente_flutter/app/data/supports/find_deputy_expenses_by_year_support.dart';
import 'package:brasil_transparente_flutter/app/helpers/date_helper.dart';

class DeputyExpensesController extends GetxController {
  final ExpenseRepository _expenseRepository;

  final int currentYear = DateHelper.currentYear();

  final RxList<ExpenseModel> _expensesByYear = <ExpenseModel>[].obs;
  final Rx<FindDeputyExpensesByYearSupport> _findDeputyExpensesByYearSupport =
      FindDeputyExpensesByYearSupport().obs;
  final RxBool _isLoading = false.obs;
  final RxBool _isError = false.obs;

  List<ExpenseModel> get expensesByYear => _expensesByYear.toList();
  bool get isLoading => _isLoading();
  bool get isError => _isError();

  DeputyExpensesController(this._expenseRepository);

  @override
  void onInit() {
    super.onInit();

    ever(_findDeputyExpensesByYearSupport, (_) => _findExpenses());

    handleFindExpenses(
      year: currentYear,
      isLoading: true,
    );
  }

  Future<void> _findExpenses() async {
    try {
      final List<ExpenseModel> data =
          await _expenseRepository.findDeputyExpensesByYear(
        _findDeputyExpensesByYearSupport(),
      );

      _expensesByYear(data);

      _isLoading(false);
      _isError(false);
    } catch (error) {
      _isLoading(false);
      _isError(true);
    }
  }

  void handleFindExpenses({
    required int year,
    bool isLoading = false,
  }) {
    _isLoading(isLoading);

    _findDeputyExpensesByYearSupport.update((val) {
      val!.year = year;
      val.deputyId = int.parse(Get.parameters['id']!);
    });
  }
}
