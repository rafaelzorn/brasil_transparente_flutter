// Bt
import 'package:brasil_transparente_flutter/app/data/repositories/proposition_repository.dart';
import 'package:brasil_transparente_flutter/app/data/repositories/procedure_repository.dart';
import 'package:brasil_transparente_flutter/app/data/models/proposition_model.dart';
import 'package:brasil_transparente_flutter/app/data/models/procedure_model.dart';

class PropositionDetailService {
  final PropositionRepository _propositionRepository;
  final ProcedureRepository _procedureRepository;

  PropositionDetailService(
    this._propositionRepository,
    this._procedureRepository,
  );

  Future<Map<String, dynamic>> findProposition(int id) async {
    try {
      final PropositionModel proposition =
          await _propositionRepository.findProposition(id);

      final List<ProcedureModel> proceedings =
          await _procedureRepository.getProceedings(id);

      proceedings.sort((a, b) => (b.sequence)!.compareTo(a.sequence!));

      return {'proposition': proposition, 'proceedings': proceedings};
    } catch (error) {
      rethrow;
    }
  }
}
