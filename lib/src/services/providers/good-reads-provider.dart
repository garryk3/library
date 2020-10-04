part of 'providers.dart';

Map<String, String> urls = {'getAuthors': 'get-authors',};

/// класс для работы с API GoodReads
class GoodReadsProvider implements IProvider {
  static final GoodReadsProvider _instance = GoodReadsProvider._private();
  final _transport = RestProvider();
  String _apiUrl;
  String _apiKey;

  GoodReadsProvider._private();

  factory GoodReadsProvider(Map<String, String> config) {
    _instance._apiUrl = config['api'];
    _instance._apiKey = config['key'];
    return _instance;
  }

  dynamic getAuthors() {
    return _transport.request(method: 'get', url: '$_apiUrl/${urls["getAuthors"]}?key=$_apiKey');
  }
}
