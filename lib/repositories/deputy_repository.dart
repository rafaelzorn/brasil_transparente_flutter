import 'package:dio/dio.dart';

// Bt
import 'package:brasil_transparente_flutter/models/deputy_model.dart';
import 'package:brasil_transparente_flutter/helpers/pagination_helper.dart';

class DeputyRepository {
  Dio _dio;

  DeputyRepository(this._dio);

  Future<List<DeputyModel>> findDeputies(PaginationHelper pagination) async {
    try {
      Response response = await _dio.get('/deputados', queryParameters: {
        'pagina': pagination.page,
        'itens': pagination.items,
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
