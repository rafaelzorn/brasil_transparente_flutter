import 'package:dio/dio.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/repositories/base_repository.dart';
import 'package:brasil_transparente_flutter/app/data/models/procedure_model.dart';

class ProcedureRepository extends BaseRepository {
  final Dio _dio;

  ProcedureRepository(this._dio);

  Future<List<ProcedureModel>> getPropositionProceedings(
    int propositionId,
  ) async {
    try {
      final Response response = await _dio.get(
        '/proposicoes/${propositionId.toString()}/tramitacoes',
      );

      return response.data['dados']
          .map<ProcedureModel>((procedure) => ProcedureModel.fromMap(procedure))
          .toList();
    } catch (error) {
      rethrow;
    }
  }
}
