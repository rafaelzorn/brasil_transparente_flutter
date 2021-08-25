import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/repositories/deputy_repository.dart';
import 'package:brasil_transparente_flutter/app/data/models/deputy_model.dart';
import 'package:brasil_transparente_flutter/app/modules/deputy_detail/controllers/deputy_detail_controller.dart';

class DeputyProfileController extends GetxController {
  final DeputyRepository _deputyRepository;

  final int deputyId = DeputyDetailController.to.deputyId;

  final Rx<DeputyModel> _deputy = DeputyModel().obs;
  final RxBool _isLoading = false.obs;
  final RxBool _isError = false.obs;

  DeputyModel get deputy => _deputy();
  bool get isLoading => _isLoading();
  bool get isError => _isError();

  DeputyProfileController(this._deputyRepository);

  @override
  void onInit() {
    super.onInit();

    _findDeputy(deputyId);
  }

  Future<void> _findDeputy(int id) async {
    try {
      _isLoading(true);

      final DeputyModel deputy = await _deputyRepository.findDeputy(id);

      _deputy(deputy);

      _isLoading(false);
      _isError(false);
    } catch (error) {
      _isLoading(false);
      _isError(true);
    }
  }

  void reload() {
    _findDeputy(deputyId);
  }
}
