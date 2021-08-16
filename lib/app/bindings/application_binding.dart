import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApplicationBinding implements Bindings {
  static final String _baseUrl = dotenv.env['DADOS_ABERTOS_API']!;

  @override
  void dependencies() {
    Get.lazyPut<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: _baseUrl,
          connectTimeout: 10000,
          receiveTimeout: 5000,
          contentType: 'application/json',
        ),
      ),
    );
  }
}
