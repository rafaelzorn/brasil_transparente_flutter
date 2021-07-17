import 'package:dio/dio.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/models/deputy_model.dart';
import 'package:brasil_transparente_flutter/app/data/supports/find_deputies_support.dart';

class DeputyRepository {
  Dio _dio;

  DeputyRepository(this._dio);

  Future<List<DeputyModel>> findDeputies(
    FindDeputiesSupport findDeputiesSupport,
  ) async {
    try {
      Response response = await _dio.get('/deputados', queryParameters: {
        'pagina': findDeputiesSupport.page,
        'itens': findDeputiesSupport.items,
        'nome': findDeputiesSupport.name,
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
