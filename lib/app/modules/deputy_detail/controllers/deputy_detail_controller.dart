import 'package:get/get.dart';

class DeputyDetailController extends GetxController {
  static DeputyDetailController get to => Get.find();
  
  final RxInt _indexStack = 0.obs;
  final RxInt _deputyId = int.parse(Get.parameters['id']!).obs;

  int get deputyId => _deputyId();
  int get indexStack => _indexStack();

  void handleIndexStack(int index) {
    _indexStack(index);
  }
}
