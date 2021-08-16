import 'package:get/get.dart';

class PropositionPdfController extends GetxController {
  final RxBool _isLoading = false.obs;
  final RxBool _isError = false.obs;

  bool get isLoading => _isLoading();
  bool get isError => _isError();

  @override
  void onInit() {
    super.onInit();

    loadDocument();
  }

  Future<void> loadDocument() async {
    try {
      _isLoading(true);

      _isLoading(false);
      _isError(false);
    } catch (error) {
      _isLoading(false);
      _isError(true);
    }
  }
}
