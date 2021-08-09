import 'package:dio/dio.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/models/proposition_model.dart';
import 'package:brasil_transparente_flutter/app/data/supports/find_propositions_support.dart';

class PropositionRepository {
  final Dio _dio;

  PropositionRepository(this._dio);

  Future<List<PropositionModel>> findPropositions(
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

      return response.data['dados']
          .map<PropositionModel>(
            (proposition) => PropositionModel.fromMap(proposition),
          )
          .toList();
    } catch (error) {
      rethrow;
    }
  }
}
