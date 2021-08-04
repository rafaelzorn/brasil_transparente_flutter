import 'package:get/get.dart';

class DeputyDetailController extends GetxController {
  final RxInt _indexStack = 0.obs;

  int get indexStack => _indexStack();

  void handleIndexStack(int index) {
    _indexStack(index);
  }
}
