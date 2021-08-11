import 'package:dio/dio.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/repositories/base_repository.dart';
import 'package:brasil_transparente_flutter/app/data/models/proposition_model.dart';
import 'package:brasil_transparente_flutter/app/data/supports/find_propositions_support.dart';

class PropositionRepository extends BaseRepository {
  final Dio _dio;

  PropositionRepository(this._dio);

  Future<Map<String, dynamic>> findPropositions(
    FindPropositionsSupport findPropositionsSupport,
  ) async {
    try {
      final Response response =
          await _dio.get('/proposicoes', queryParameters: {
        'pagina': findPropositionsSupport.page,
        'itens': findPropositionsSupport.items,
        'ano': findPropositionsSupport.year,
        'idDeputadoAutor': findPropositionsSupport.deputyId,
        'ordem': 'DESC',
        'ordenarPor': 'ano'
      });

      final List<PropositionModel> propositions = response.data['dados']
          .map<PropositionModel>(
            (proposition) => PropositionModel.fromMap(proposition),
          )
          .toList();

      return {
        'propositions': propositions,
        'last_page': isLastPage(links: response.data['links']),
      };
    } catch (error) {
      rethrow;
    }
  }
}
