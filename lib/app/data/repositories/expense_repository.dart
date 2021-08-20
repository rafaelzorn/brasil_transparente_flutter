import 'package:dio/dio.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/models/expense_model.dart';
import 'package:brasil_transparente_flutter/app/data/repositories/base_repository.dart';
import 'package:brasil_transparente_flutter/app/data/supports/find_deputy_expenses_by_year_support.dart';

class ExpenseRepository extends BaseRepository {
  final Dio _dio;

  ExpenseRepository(this._dio);

  Future<List<ExpenseModel>> findDeputyExpensesByYear(
    FindDeputyExpensesByYearSupport findDeputyExpensesByYearSupport,
  ) async {
    try {
      final String deputyId =
          findDeputyExpensesByYearSupport.deputyId.toString();

      bool next = true;
      int page = 1;
      List data = [];

      while (next) {
        final Response response = await findDeputyExpenses(
          year: findDeputyExpensesByYearSupport.year,
          deputyId: deputyId,
          page: page,
          items: 100,
        );

        data.addAll(response.data['dados']);

        if (isLastPage(links: response.data['links'])) {
          next = false;
        }

        page++;
      }

      data.sort((a, b) => (a['mes'])!.compareTo(b['mes']!));

      List<Map<String, dynamic>> expenses = [];

      for (dynamic expense in data) {
        final int index = expense['mes'] - 1;
        final double documentValue = expense['valorDocumento'];

        if (expenses.asMap().containsKey(index)) {
          expenses[index]['valor_total_mes'] =
              expenses[index]['valor_total_mes'] + documentValue;

          continue;
        }

        expenses.insert(index, {
          'mes': expense['mes'],
          'valor_total_mes': documentValue,
        });
      }

      return expenses
          .map<ExpenseModel>((expense) => ExpenseModel.fromMap(expense))
          .toList();
    } catch (error) {
      rethrow;
    }
  }

  Future<Response<dynamic>> findDeputyExpenses({
    required int year,
    required int page,
    required String deputyId,
    required int items,
  }) async {
    final Response response =
        await _dio.get('/deputados/$deputyId/despesas', queryParameters: {
      'pagina': page,
      'itens': items,
      'ano': year,
    });

    return response;
  }
}
