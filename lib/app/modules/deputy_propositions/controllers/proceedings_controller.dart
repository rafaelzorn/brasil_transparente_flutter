import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/repositories/procedure_repository.dart';
import 'package:brasil_transparente_flutter/app/data/models/procedure_model.dart';

class ProceedingsController extends GetxController {
  static ProceedingsController get to => Get.find();

  final ProcedureRepository _procedureRepository;

  final RxList<ProcedureModel> _proceedings = <ProcedureModel>[].obs;
  final RxBool _isLoading = false.obs;
  final RxBool _isError = false.obs;

  List<ProcedureModel> get proceedings => _proceedings.toList();
  bool get isLoading => _isLoading();
  bool get isError => _isError();

  ProceedingsController(this._procedureRepository);

  Future<void> _getProceedings({required int propositionId}) async {
    try {
      final List<ProcedureModel> proceedings =
          await _procedureRepository.getProceedings(propositionId);

      _proceedings(proceedings);

      _isLoading(false);
      _isError(false);
    } catch (error) {
      _isLoading(false);
      _isError(true);
    }
  }

  void handleGetProceedings({required int propositionId}) {
    _isLoading(true);

    _getProceedings(propositionId: propositionId);
  }
}
