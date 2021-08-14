import 'package:dio/dio.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/repositories/base_repository.dart';
import 'package:brasil_transparente_flutter/app/data/models/political_party_model.dart';
import 'package:brasil_transparente_flutter/app/data/supports/get_political_parties_support.dart';

class PoliticalPartyRepository extends BaseRepository {
  final Dio _dio;

  PoliticalPartyRepository(this._dio);

  Future<Map<String, dynamic>> getPoliticalParties(
    GetPoliticalPartiesSupport getPoliticalPartiesSupport,
  ) async {
    try {
      final Response response = await _dio.get('/partidos', queryParameters: {
        'pagina': getPoliticalPartiesSupport.page,
        'itens': getPoliticalPartiesSupport.items,
      });

      final List<PoliticalPartyModel> deputies = response.data['dados']
          .map<PoliticalPartyModel>(
            (politicalParty) => PoliticalPartyModel.fromMap(politicalParty),
          )
          .toList();

      return {
        'political_parties': deputies,
        'last_page': isLastPage(links: response.data['links']),
      };
    } catch (error) {
      rethrow;
    }
  }
}
