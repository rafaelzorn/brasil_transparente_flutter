import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => Dio(
        BaseOptions(
          baseUrl: 'https://dadosabertos.camara.leg.br/api/v2',
          connectTimeout: 10000,
          receiveTimeout: 5000,
          contentType: 'application/json',
        ),
      ),
    );
  }
}
