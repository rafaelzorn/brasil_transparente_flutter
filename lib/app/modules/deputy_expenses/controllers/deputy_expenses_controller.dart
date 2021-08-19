import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/repositories/expense_repository.dart';
import 'package:brasil_transparente_flutter/app/data/supports/find_expenses_by_year_support.dart';
import 'package:brasil_transparente_flutter/app/helpers/date_helper.dart';

class DeputyExpensesController extends GetxController {
  final ExpenseRepository _expenseRepository;

  final int currentYear = DateHelper.currentYear();

  final Rx<FindExpensesByYearSupport> _findExpensesByYearSupport =
      FindExpensesByYearSupport().obs;
  final RxBool _isLoading = false.obs;
  final RxBool _isError = false.obs;

  bool get isLoading => _isLoading();
  bool get isError => _isError();

  DeputyExpensesController(this._expenseRepository);

  @override
  void onInit() {
    super.onInit();

    ever(_findExpensesByYearSupport, (_) => _findExpenses());

    handleFindExpenses(
      year: currentYear,
      isLoading: true,
    );
  }

  Future<void> _findExpenses() async {
    try {
      final Map<String, dynamic> data =
          await _expenseRepository.findExpensesByYear(
        _findExpensesByYearSupport(),
      );

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

    _findExpensesByYearSupport.update((val) {
      val!.year = year;
      val.deputyId = int.parse(Get.parameters['id']!);
    });
  }
}
