import 'package:get/get.dart';

import 'package:library/src/infrastructure/interfaces/interfaces.dart';

class HttpService extends GetConnect implements IHttp {
  String? apiKey;

  HttpService.fromConfig(Map<String, dynamic> config) {
    httpClient.baseUrl = config['baseUrl'] as String;
    apiKey = config['apiKey'] as String;
  }

  @override
  Future<Response<dynamic>> getData(String url) => get(url);

  @override
  Future<Response<dynamic>> postData(String url, Map<dynamic, dynamic> data) => post(url, data);
}
