import 'package:dio/dio.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/models/state_model.dart';

class StateRepository {
  final Dio _dio;

  StateRepository(this._dio);

  Future<List<StateModel>> getStates() async {
    try {
      final Response response = await _dio.get('/referencias/deputados/siglaUF');

      return response.data['dados']
          .map<StateModel>(
            (state) => StateModel.fromMap(state),
          )
          .toList();
    } catch (error) {
      rethrow;
    }
  }
}
