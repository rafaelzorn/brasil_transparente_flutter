import 'package:dio/dio.dart';
import 'package:jiffy/jiffy.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/models/expense_model.dart';
import 'package:brasil_transparente_flutter/app/data/repositories/base_repository.dart';
import 'package:brasil_transparente_flutter/app/data/supports/find_deputy_expenses_by_year_support.dart';
import 'package:brasil_transparente_flutter/app/data/supports/find_deputy_expenses_by_month_support.dart';

class ExpenseRepository extends BaseRepository {
  final Dio _dio;

  ExpenseRepository(this._dio);

  Future<Map<String, dynamic>> findDeputyExpensesByMonth(
    FindDeputyExpensesByMonthSupport FindDeputyExpensesByMonthSupport,
  ) async {
    try {
      final Response response = await findDeputyExpenses(
        year: FindDeputyExpensesByMonthSupport.year,
        deputyId: FindDeputyExpensesByMonthSupport.deputyId.toString(),
        page: FindDeputyExpensesByMonthSupport.page,
        items: FindDeputyExpensesByMonthSupport.items,
        month: FindDeputyExpensesByMonthSupport.month,
      );

      final List<ExpenseModel> expenses = response.data['dados']
          .map<ExpenseModel>(
            (expense) => ExpenseModel.fromMap(expense),
          )
          .toList();

      return {
        'expenses': expenses,
        'last_page': isLastPage(links: response.data['links']),
      };
    } catch (error) {
      rethrow;
    }
  }

  Future<List<ExpenseModel>> findDeputyExpensesByYear(
    FindDeputyExpensesByYearSupport findDeputyExpensesByYearSupport,
  ) async {
    final year = findDeputyExpensesByYearSupport.year;
    bool next = true;
    int page = 1;
    List data = [];

    while (next) {
      final Response response = await findDeputyExpenses(
        year: year,
        deputyId: findDeputyExpensesByYearSupport.deputyId.toString(),
        page: page,
        items: 100,
      );

      data.addAll(response.data['dados']);

      if (isLastPage(links: response.data['links'])) {
        next = false;
      }

      page++;
    }

    List<dynamic> expenses = groupByExpensesByMonth(data: data, year: year);

    return expenses
        .map<ExpenseModel>((expense) => ExpenseModel.fromMap(expense))
        .toList();
  }

  Future<Response<dynamic>> findDeputyExpenses({
    required int year,
    required int page,
    required String deputyId,
    required int items,
    int? month,
  }) async {
    final Response response =
        await _dio.get('/deputados/$deputyId/despesas', queryParameters: {
      'pagina': page,
      'itens': items,
      'ano': year,
      'mes': month ?? '',
      'ordenarPor': 'dataDocumento',
      'ordem': 'DESC'
    });

    return response;
  }

  List<dynamic> groupByExpensesByMonth({
    required List<dynamic> data,
    required int year,
  }) {
    final List<dynamic> expenses = [];

    for (dynamic expense in data) {
      final double documentValue = expense['valorDocumento'];

      if (expenses.any((item) => item['mes'] == expense['mes'])) {
        final int index =
            expenses.indexWhere((item) => item['mes'] == expense['mes']);

        expenses[index]['valor_total_mes'] =
            expenses[index]['valor_total_mes'] + documentValue;

        continue;
      }

      expenses.add({'mes': expense['mes'], 'valor_total_mes': documentValue});
    }

    Jiffy currentDate = Jiffy();
    List months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

    for (dynamic month in months) {
      if (expenses.any((item) => item['mes'] == month)) {
        continue;
      }

      final int currentMonth = int.parse(currentDate.format('M'));
      final int currentYear = int.parse(currentDate.format('yyyy'));

      if (currentYear == year && month > currentMonth) {
        continue;
      }

      expenses.add({'mes': month, 'valor_total_mes': 0.00});
    }

    expenses.sort((a, b) => (a['mes'])!.compareTo(b['mes']!));

    return expenses;
  }
}
