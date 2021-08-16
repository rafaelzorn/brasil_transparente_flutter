import 'package:get/get.dart';

class PropositionPdfController extends GetxController {
  final RxBool _isError = false.obs;

  bool get isError => _isError();

  void error(bool error) {
    _isError(error);
  }
}
