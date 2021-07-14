import 'package:dio/dio.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/models/deputy_model.dart';
import 'package:brasil_transparente_flutter/app/data/supports/pagination_support.dart';

class DeputyRepository {
  Dio _dio;

  DeputyRepository(this._dio);

  Future<List<DeputyModel>> findDeputies(
    PaginationSupport paginationSupport,
  ) async {
    try {
      Response response = await _dio.get('/deputados', queryParameters: {
        'pagina': paginationSupport.page,
        'itens': paginationSupport.items,
      });

      return response.data['dados']
          .map<DeputyModel>(
            (deputy) => DeputyModel.fromMap(deputy),
          )
          .toList();
    } catch (error) {
      rethrow;
    }
  }
}
