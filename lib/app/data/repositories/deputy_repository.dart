import 'package:dio/dio.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/repositories/base_repository.dart';
import 'package:brasil_transparente_flutter/app/data/models/deputy_model.dart';
import 'package:brasil_transparente_flutter/app/data/supports/find_deputies_support.dart';

class DeputyRepository extends BaseRepository {
  final Dio _dio;

  DeputyRepository(this._dio);

  Future<Map<String, dynamic>> findDeputies(
    FindDeputiesSupport findDeputiesSupport,
  ) async {
    try {
      final Response response = await _dio.get('/deputados', queryParameters: {
        'pagina': findDeputiesSupport.page,
        'itens': findDeputiesSupport.items,
        'nome': findDeputiesSupport.filters['name'] ?? '',
        'siglaUf': findDeputiesSupport.filters['siglaUf'] ?? '',
        'siglaPartido': findDeputiesSupport.filters['siglaPartido'] ?? '',
      });

      final List<DeputyModel> deputies = response.data['dados']
          .map<DeputyModel>(
            (deputy) => DeputyModel.fromMap(deputy),
          )
          .toList();

      return {
        'deputies': deputies,
        'last_page': isLastPage(links: response.data['links']),
      };
    } catch (error) {
      rethrow;
    }
  }

  Future<DeputyModel> findDeputy(int id) async {
    try {
      Response response = await _dio.get('/deputados/$id');

      final lastStatus = response.data['dados']['ultimoStatus'];

      response.data['dados']['nome'] = lastStatus['nome'];
      response.data['dados']['siglaPartido'] = lastStatus['siglaPartido'];
      response.data['dados']['urlFoto'] = lastStatus['urlFoto'];
      response.data['dados']['email'] = lastStatus['email'];
      response.data['dados']['situacao'] = lastStatus['situacao'];
      response.data['dados']['telefone'] = lastStatus['gabinete']['telefone'];

      return DeputyModel.fromMap(response.data['dados']);
    } catch (error) {
      rethrow;
    }
  }
}
