import 'package:dio/dio.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/repositories/base_repository.dart';
import 'package:brasil_transparente_flutter/app/data/supports/find_expenses_by_year_support.dart';

class ExpenseRepository extends BaseRepository {
  final Dio _dio;

  ExpenseRepository(this._dio);

  Future<Map<String, dynamic>> findExpensesByYear(
    FindExpensesByYearSupport findExpensesByYearSupport,
  ) async {
    try {
      final String deputyId = findExpensesByYearSupport.deputyId.toString();

      final Response response =
          await _dio.get('/deputados/$deputyId/despesas', queryParameters: {
        'pagina': 1,
        'itens': 100,
        'ano': findExpensesByYearSupport.year,
        'ordem': 'DESC',
      });

      print(response);

      return {
        'propositions': '',
        'last_page': '',
      };
    } catch (error) {
      rethrow;
    }
  }
}
