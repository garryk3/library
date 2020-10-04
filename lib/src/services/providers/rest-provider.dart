part of 'providers.dart';

class RestProvider implements IProvider {
  static final RestProvider _instance = RestProvider._private();

  factory RestProvider() {
    return _instance;
  }

  RestProvider._private() {
    _init();
  }

  dynamic _init() {}

  Future<dynamic> request({String method, dynamic url, Map<String, String> headers, dynamic body}) async {
    var send = _get;
    if (method.toLowerCase() == 'post') {
      send = _post;
    }

    try {
      final response = await Function.apply(send, [url], {#headers: headers, #body: body});
      if (response.statusCode != 200) {
        throw (response.statusCode);
      }
      var jsonResponse = convert.jsonDecode(response.body);
      return {'error': null, 'result': jsonResponse};
    } catch (error) {
      return {'error': null, 'result': error.message};
    }
  }

  Future<dynamic> _get(String url, {Map<String, String> headers}) async {
    return http.get;
  }

  Future<dynamic> _post(String url, {Map<String, String> headers, dynamic body}) async {
    return http.post;
  }
}
