import 'package:get/get.dart';

class DeputyDetailController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    _findDeputy();
  }

  Future<void> _findDeputy() async {
    print('Find deputy');
  }
}
