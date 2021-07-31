import 'package:dio/dio.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/models/political_party_model.dart';

class PoliticalPartyRepository {
  final Dio _dio;

  PoliticalPartyRepository(this._dio);

  Future<List<PoliticalPartyModel>> getPoliticalParties() async {
    try {
      final Response response = await _dio.get('/partidos?itens=100');

      return response.data['dados']
          .map<PoliticalPartyModel>(
            (politicalParty) => PoliticalPartyModel.fromMap(politicalParty),
          )
          .toList();
    } catch (error) {
      rethrow;
    }
  }
}
