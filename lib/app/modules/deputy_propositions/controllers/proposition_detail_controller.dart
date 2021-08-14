import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/models/procedure_model.dart';
import 'package:brasil_transparente_flutter/app/data/models/proposition_model.dart';
import 'package:brasil_transparente_flutter/app/services/proposition_detail_service.dart';

class PropositionDetailController extends GetxController {
  static PropositionDetailController get to => Get.find();

  final PropositionDetailService _propositionDetailService;

  final Rx<PropositionModel> _proposition = PropositionModel().obs;
  final RxList<ProcedureModel> _proceedings = <ProcedureModel>[].obs;
  final RxBool _isLoading = false.obs;
  final RxBool _isError = false.obs;

  List<ProcedureModel> get proceedings => _proceedings.toList();
  PropositionModel get proposition => _proposition();
  bool get isLoading => _isLoading();
  bool get isError => _isError();

  PropositionDetailController(this._propositionDetailService);

  Future<void> _findProposition({required int id}) async {
    try {
      final Map<String, dynamic> data =
          await _propositionDetailService.findProposition(id);

      _proceedings(data['proceedings']);
      _proposition(data['proposition']);

      _isLoading(false);
      _isError(false);
    } catch (error) {
      _isLoading(false);
      _isError(true);
    }
  }

  void handleFindProposition({required int id}) {
    _isLoading(true);

    _findProposition(id: id);
  }
}
