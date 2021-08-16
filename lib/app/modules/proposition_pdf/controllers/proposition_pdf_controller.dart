import 'package:get/get.dart';
// import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class PropositionPdfController extends GetxController {
  // final Rx<PDFDocument> _document = PDFDocument().obs;
  final RxBool _isLoading = false.obs;
  final RxBool _isError = false.obs;

  // PDFDocument get document => _document();
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

      // PDFDocument document = await PDFDocument.fromURL(Get.arguments['pdf']);

      // _document(document);

      _isLoading(false);
      _isError(false);
    } catch (error) {
      _isLoading(false);
      _isError(true);
    }
  }
}
