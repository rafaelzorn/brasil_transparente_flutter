import 'package:get/get.dart';

class ExpenseDocumentPdfController extends GetxController {
  final RxBool _isError = false.obs;

  bool get isError => _isError();

  void error(bool error) {
    _isError(error);
  }
}
